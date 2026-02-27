import SwiftUI
import Foundation

@MainActor
final class TTSCoordinator: ObservableObject {

    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var progress: Double = 0.0
    @Published private(set) var isSpeaking: Bool = false
    @Published private(set) var isPaused: Bool = false

    private var targetProgress: Double = 0.0
    private var displayTimer: Timer?
    private let smoothing: Double = 0.10

    func prepare(stepIndex: Int) {
        guard !isPaused else { return }
        stopTimer()
        currentIndex = stepIndex
        isSpeaking = true
        targetProgress = 0.0
        progress = 0.0
        startTimer()
    }

    func update(range: NSRange, totalCharacters: Int) {
        guard !isPaused else { return }
        let spoken = range.location + range.length
        targetProgress = min(Double(spoken) / Double(max(totalCharacters, 1)), 1.0)
    }

    func finish() {
        guard !isPaused else { return }
        targetProgress = 1.0
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(400))
            progress = 1.0
            isSpeaking = false
            stopTimer()
        }
    }

    func pause() {
        isPaused = true
        isSpeaking = false
        stopTimer()
    }

    func resume() {
        isPaused = false
    }

    func reset() {
        stopTimer()
        targetProgress = 0.0
        progress = 0.0
        isSpeaking = false
        isPaused = false
    }

    private func startTimer() {
        displayTimer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in self.tick() }
        }
        RunLoop.main.add(displayTimer!, forMode: .common)
    }

    private func stopTimer() {
        displayTimer?.invalidate()
        displayTimer = nil
    }

    private func tick() {
        guard isSpeaking, !isPaused else { return }
        let delta = targetProgress - progress
        guard abs(delta) > 0.001 else {
            if progress != targetProgress { progress = targetProgress }
            return
        }
        progress += delta * smoothing
    }
}

struct EmergencyFlowView<Step: EmergencyStep, InteractiveContent: View>: View {

    let steps: [Step]
    let navigationTitle: String
    var paginationAccentColor: Color = Color(red: 0.85, green: 0.15, blue: 0.15)
    @ViewBuilder private let interactiveContent: (Step, Bool) -> InteractiveContent

    @Environment(\.scenePhase) private var scenePhase

    @State private var index = 0
    @State private var didSwipeManually = false
    @State private var isPaused = false
    @State private var isActive = false
    @State private var advanceTask: Task<Void, Never>?
    @State private var showSwipeHint = false

    @AppStorage("hasSeenSwipeHint") private var hasSeenSwipeHint = false

    @StateObject private var audio = AudioCueManager()
    @StateObject private var tts = TTSCoordinator()

    init(
        steps: [Step],
        navigationTitle: String,
        paginationAccentColor: Color = Color(red: 0.85, green: 0.15, blue: 0.15),
        @ViewBuilder interactiveContent: @escaping (Step, Bool) -> InteractiveContent
    ) {
        self.steps = steps
        self.navigationTitle = navigationTitle
        self.paginationAccentColor = paginationAccentColor
        self.interactiveContent = interactiveContent
    }

    var body: some View {
        TabView(selection: $index) {
            ForEach(steps.indices, id: \.self) { pageIndex in
                EmergencyPageView(
                    step: steps[pageIndex],
                    stepNumber: pageIndex + 1,
                    totalSteps: steps.count,
                    isPageVisible: pageIndex == index
                ) {
                    interactiveContent(steps[pageIndex], pageIndex == index)
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: indicatorHeight)
                }
                .tag(pageIndex)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.3), value: index)

        .overlay(alignment: .top) {
            VStack(spacing: 0) {
                EmergencyPaginationIndicator(
                    coordinator: tts,
                    total: steps.count,
                    accentColor: paginationAccentColor
                )
                Divider()
            }
            .background(Color(.systemBackground))
        }

        .overlay(alignment: .bottom) {
            if showSwipeHint {
                SwipeHintView()
                    .padding(.bottom, 24)
                    .transition(.opacity.combined(with: .scale(scale: 0.96)))
            }
        }
        .environment(\.stopEmergencyAudio, EmergencyAudioStopAction {
            silenceAudio()
        })

        .onChange(of: index) { _, _ in
            guard isActive, !isPaused else { return }
            didSwipeManually = true
            showSwipeHint = false
            hasSeenSwipeHint = true
            speakStep(at: index)
        }

        .onAppear {
            isActive = true

            audio.onWillSpeak = { range, total in
                Task { @MainActor in
                    guard isActive else { return }
                    tts.update(range: range, totalCharacters: total)
                }
            }

            audio.onFinished = {
                Task { @MainActor in
                    guard isActive else { return }
                    tts.finish()
                    handleAudioFinished()
                }
            }

            if !hasSeenSwipeHint {
                withAnimation(.easeOut(duration: 0.25)) {
                    showSwipeHint = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeIn(duration: 0.2)) {
                        showSwipeHint = false
                    }
                    hasSeenSwipeHint = true
                }
            }

            speakStep(at: 0)
        }

        .onDisappear {
            teardown()
        }

        .background(Color(.systemBackground))
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)

        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isPaused { resume() } else { pause() }
                } label: {
                    Image(systemName: isPaused ? "play.fill" : "pause.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(isPaused ? .green : .secondary)
                }
            }
        }

        .toolbar(.hidden, for: .tabBar)

        .onChange(of: scenePhase) { _, newValue in
            if newValue != .active { teardown() }
        }
    }

    private let indicatorHeight: CGFloat = 50

    private func teardown() {
        isActive = false
        advanceTask?.cancel()
        advanceTask = nil
        audio.onFinished = nil
        audio.onWillSpeak = nil
        audio.stop()
        tts.reset()
    }

    private func silenceAudio() {
        audio.onFinished = nil
        audio.onWillSpeak = nil
        audio.stop()
        tts.reset()
    }

    private func pause() {
        isPaused = true
        audio.pause()
        tts.pause()
    }

    private func resume() {
        isPaused = false
        tts.resume()
        speakStep(at: index)
    }

    private func speakStep(at stepIndex: Int) {
        guard isActive else { return }
        tts.prepare(stepIndex: stepIndex)
        audio.speak(steps[stepIndex].audio)
    }

    private func handleAudioFinished() {
        guard isActive, !isPaused else { return }
        if didSwipeManually {
            didSwipeManually = false
            return
        }
        guard !steps[index].isInteractive else { return }
        guard index < steps.count - 1 else { return }

        let advancingFrom = index

        advanceTask?.cancel()
        advanceTask = Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(600))
            guard !Task.isCancelled, isActive, !isPaused, index == advancingFrom else { return }
            index += 1
            speakStep(at: index)
        }
    }
}

extension EmergencyFlowView where InteractiveContent == EmptyView {
    init(
        steps: [Step],
        navigationTitle: String,
        paginationAccentColor: Color = Color(red: 0.85, green: 0.15, blue: 0.15)
    ) {
        self.init(
            steps: steps,
            navigationTitle: navigationTitle,
            paginationAccentColor: paginationAccentColor
        ) { _, _ in EmptyView() }
    }
}

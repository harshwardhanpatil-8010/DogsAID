import SwiftUI
import Foundation

// MARK: - TTSCoordinator (unchanged)

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
            self.progress = 1.0
            self.isSpeaking = false
            self.stopTimer()
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
        displayTimer = Timer.scheduledTimer(
            withTimeInterval: 1.0 / 60.0,
            repeats: true
        ) { [weak self] _ in
            guard let self = self else { return }
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

// MARK: - EmergencyFlowView

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
    @State private var advanceTask: Task<Void, Never>? = nil

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

    // MARK: Body

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
                .safeAreaInset(edge: .top, spacing: 0) {
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

        .environment(\.stopEmergencyAudio, EmergencyAudioStopAction {
            silenceAudio()
        })
        .onChange(of: index) { oldValue, newValue in
            guard isActive, !isPaused else { return }
            didSwipeManually = true
            speakStep(at: newValue)
        }
        .onAppear {
            isActive = true

            audio.onWillSpeak = { range, total in
                Task { @MainActor in
                    guard self.isActive else { return }
                    tts.update(range: range, totalCharacters: total)
                }
            }

            audio.onFinished = {
                Task { @MainActor in
                    guard self.isActive else { return }
                    tts.finish()
                    handleAudioFinished()
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
                        .animation(.easeInOut(duration: 0.2), value: isPaused)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .onChange(of: scenePhase) { oldValue, newValue in
            if newValue != .active { teardown() }
        }
    }

    // MARK: - Teardown

    private func teardown() {
        isActive = false
        advanceTask?.cancel()
        advanceTask = nil
        audio.onFinished  = nil
        audio.onWillSpeak = nil
        audio.stop()
        tts.reset()
    }

    // MARK: - Audio control


    private func silenceAudio() {
        audio.onFinished  = nil
        audio.onWillSpeak = nil
        audio.stop()
        tts.reset()


        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(200))
            guard isActive else { return }
            audio.onWillSpeak = { range, total in
                Task { @MainActor in
                    guard self.isActive else { return }
                    tts.update(range: range, totalCharacters: total)
                }
            }
            audio.onFinished = {
                Task { @MainActor in
                    guard self.isActive else { return }
                    tts.finish()
                    handleAudioFinished()
                }
            }
        }
    }

    // MARK: - Private helpers

    private let indicatorHeight: CGFloat = 50

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
            guard !Task.isCancelled else { return }
            guard isActive else { return }
            guard !isPaused else { return }
            guard index == advancingFrom else { return }
            didSwipeManually = false
            index = index + 1
            speakStep(at: index)
        }
    }
}

// MARK: - Convenience init (no interactive content)

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

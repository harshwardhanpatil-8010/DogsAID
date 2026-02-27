import SwiftUI

// MARK: - Backward-compatible typealias

typealias CPRPageView = EmergencyPageView<CPRStep, AnyView>

// MARK: - CPR Coordinator

@MainActor
final class CPRCoordinator: ObservableObject {

    enum Phase { case idle, compressions, breaths }

    @Published var phase: Phase = .idle
    @Published var compressionCount = 0
    @Published var breathCount = 0
    @Published var cycleCount = 0

    private let bpm: Double = 110
    private let metronome = MetronomeManager()
    private var beatTimer: Timer?

    // MARK: Public API

    func toggle() {
        if phase == .idle {
            startCompressions()
        } else {
            hardStop()
        }
    }

    func gaveBreath() {
        breathCount += 1
        if breathCount >= 2 {
            cycleCount += 1
            startCompressions()
        }
    }

    func hardStop() {
        stopTimer()
        metronome.stop()
        phase = .idle
        compressionCount = 0
        breathCount = 0
    }

    // MARK: Private

    private func startCompressions() {
        stopTimer()
        compressionCount = 0
        phase = .compressions
        metronome.start(bpm: bpm)
        let interval = 60.0 / bpm
        beatTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in
                self.compressionCount += 1
                if self.compressionCount >= 30 {
                    self.stopTimer()
                    self.metronome.stop()
                    self.breathCount = 0
                    self.phase = .breaths
                }
            }
        }
        RunLoop.main.add(beatTimer!, forMode: .common)
    }

    private func stopTimer() {
        beatTimer?.invalidate()
        beatTimer = nil
    }
}

// MARK: - CPRCycleView

struct CPRCycleView: View {

    let isPageVisible: Bool

    @StateObject private var cpr = CPRCoordinator()

    @Environment(\.stopEmergencyAudio) private var stopEmergencyAudio

    var body: some View {
        VStack(spacing: 20) {

            CPRHeartBeatView(bpm: 110, isActive: cpr.phase == .compressions)
                .frame(width: 130, height: 130)

            Group {
                switch cpr.phase {
                case .idle:
                    Text("Tap Start to begin CPR")
                        .foregroundStyle(.white.opacity(0.70))

                case .compressions:
                    VStack(spacing: 6) {
                        Text("COMPRESS")
                            .font(.system(size: 22, weight: .black))
                            .foregroundStyle(.red)
                        Text("\(cpr.compressionCount) / 30")
                            .font(.system(size: 36, weight: .bold).monospacedDigit())
                        Text("Push hard & fast – 1–2 inches deep")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.75))
                            .multilineTextAlignment(.center)
                    }

                case .breaths:
                    VStack(spacing: 6) {
                        Text("RESCUE BREATHS")
                            .font(.system(size: 22, weight: .black))
                            .foregroundStyle(Color(red: 0.20, green: 0.55, blue: 0.95))
                        Text("\(cpr.breathCount) / 2")
                            .font(.system(size: 36, weight: .bold).monospacedDigit())
                        Text("Close mouth – breathe gently into nose")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.75))
                            .multilineTextAlignment(.center)
                        Button("I gave a breath") { cpr.gaveBreath() }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            .padding(.top, 4)
                    }
                }
            }
            .frame(minHeight: 110)
            .animation(.easeInOut(duration: 0.25), value: cpr.phase)

            if cpr.cycleCount > 0 {
                Text("Cycles completed: \(cpr.cycleCount)")
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.55))
            }

            Button {
                if cpr.phase == .idle {
                    stopEmergencyAudio()
                    cpr.toggle()
                } else {
                    cpr.toggle()
                }
            } label: {
                Text(cpr.phase == .idle ? "Start CPR" : "Stop CPR")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(cpr.phase == .idle ? Color.green : Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(14)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .onChange(of: isPageVisible) { _, newValue in
            if !newValue { cpr.hardStop() }
        }
        .onDisappear {
            cpr.hardStop()
        }
    }
}

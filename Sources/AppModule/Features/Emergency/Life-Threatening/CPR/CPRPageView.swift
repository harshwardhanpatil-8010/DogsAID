import SwiftUI

@MainActor
final class CPRCoordinator: ObservableObject {

    enum Phase { case idle, compressions, breaths }

    @Published var phase: Phase = .idle
    @Published var compressionCount = 0
    @Published var breathCount = 0
    @Published var cycleCount = 0

    private let bpm: Double = 110
    private let metronome = MetronomeManager()
    private var timer: Timer?

    func toggle() {
        phase == .idle ? startCompressions() : hardStop()
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

    private func startCompressions() {
        stopTimer()
        compressionCount = 0
        breathCount = 0
        phase = .compressions
        metronome.start(bpm: bpm)

        let interval = 60.0 / bpm
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in
                compressionCount += 1
                if compressionCount >= 30 {
                    stopTimer()
                    metronome.stop()
                    phase = .breaths
                }
            }
        }
        RunLoop.main.add(timer!, forMode: .common)
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
// MARK: - CPRCycleView
import SwiftUI

struct CPRCycleView: View {

    let isPageVisible: Bool

    @StateObject private var cpr = CPRCoordinator()
    @Environment(\.stopEmergencyAudio) private var stopEmergencyAudio

    var body: some View {
        VStack(spacing: 24) {

            CPRHeartBeatView(bpm: 110, isActive: cpr.phase == .compressions)
                .frame(height: 120)

            Group {
                switch cpr.phase {
                case .idle:
                    Text("Tap Start to begin CPR")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                case .compressions:
                    VStack(spacing: 6) {
                        Text("COMPRESS")
                            .font(.title3.bold())
                            .foregroundStyle(.red)
                        Text("\(cpr.compressionCount) / 30")
                            .font(.largeTitle.monospacedDigit())
                        Text("Push hard and fast")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }

                case .breaths:
                    VStack(spacing: 6) {
                        Text("RESCUE BREATHS")
                            .font(.title3.bold())
                            .foregroundStyle(.blue)
                        Text("\(cpr.breathCount) / 2")
                            .font(.largeTitle.monospacedDigit())
                        Button("I gave a breath") {
                            cpr.gaveBreath()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .frame(minHeight: 120)
            .animation(.easeInOut, value: cpr.phase)

            if cpr.cycleCount > 0 {
                Text("Cycles completed: \(cpr.cycleCount)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Button {
                if cpr.phase == .idle {
                    stopEmergencyAudio()
                }
                cpr.toggle()
            } label: {
                Text(cpr.phase == .idle ? "Start CPR" : "Stop CPR")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(cpr.phase == .idle ? .green : .red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding()
        .onChange(of: isPageVisible) { _, visible in
            if !visible { cpr.hardStop() }
        }
        .onDisappear {
            cpr.hardStop()
        }
    }
}

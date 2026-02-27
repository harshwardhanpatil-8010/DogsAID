

import SwiftUI

struct EmergencyPaginationIndicator: View {

    @ObservedObject var coordinator: TTSCoordinator
    let total: Int
    var accentColor: Color = Color(red: 0.85, green: 0.15, blue: 0.15)

    private var progress: Double {
        guard total > 1 else { return 1.0 }
        return Double(coordinator.currentIndex + 1) / Double(total)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text("Step \(coordinator.currentIndex + 1) of \(total)")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.secondary)
                .contentTransition(.numericText())
                .animation(.easeInOut(duration: 0.25), value: coordinator.currentIndex)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(accentColor.opacity(0.15))
                        .frame(height: 4)

                    Capsule()
                        .fill(accentColor)
                        .frame(width: geo.size.width * progress, height: 4)
                        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: coordinator.currentIndex)
                }
            }
            .frame(height: 4)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Step \(coordinator.currentIndex + 1) of \(total)")
        .accessibilityValue("\(Int(progress * 100)) percent complete")
    }
}

// MARK: - Audio Duration Helper

struct AudioDuration {

    static func estimate(for text: String, wordsPerMinute: Double = 140) -> String {
        formatted(seconds: rawSeconds(for: text, wordsPerMinute: wordsPerMinute))
    }

    static func rawSeconds(for text: String, wordsPerMinute: Double = 140) -> TimeInterval {
        let wc = Double(
            text.components(separatedBy: .whitespacesAndNewlines)
                .filter { !$0.isEmpty }.count
        )
        guard wc > 0, wordsPerMinute > 0 else { return 0 }
        return (wc / wordsPerMinute) * 60
    }

    static func totalEstimate(for steps: [String], wordsPerMinute: Double = 140) -> String {
        formatted(seconds: steps.reduce(0) { $0 + rawSeconds(for: $1, wordsPerMinute: wordsPerMinute) })
    }

    private static func formatted(seconds: TimeInterval) -> String {
        let t = Int(seconds.rounded())
        guard t > 0 else { return "< 1 sec" }
        let m = t / 60; let s = t % 60
        switch (m, s) {
        case (0, let s): return "~\(s) sec"
        case (let m, 0): return "~\(m) min"
        default:         return "~\(m) min \(s) sec"
        }
    }
}

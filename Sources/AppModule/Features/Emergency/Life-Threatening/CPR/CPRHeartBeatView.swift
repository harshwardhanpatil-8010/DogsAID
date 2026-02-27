import SwiftUI

struct CPRHeartBeatView: View {
    let bpm: Double
    let isActive: Bool
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.5

    var body: some View {
        ZStack {
            // Main Heart Icon
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
                .scaleEffect(scale)
        }
        .onChange(of: isActive) { _, newValue in
            if newValue {
                startBeating()
            } else {
                scale = 1.0
            }
        }
    }

    private func startBeating() {
        let interval = 60.0 / bpm
        withAnimation(.easeInOut(duration: interval / 2).repeatForever(autoreverses: true)) {
            scale = 1.2
        }
    }
}

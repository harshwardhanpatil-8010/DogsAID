import SwiftUI

struct CPRHeartBeatView: View {
    let bpm: Double
    let isActive: Bool

    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 88, height: 88)
            .foregroundStyle(.red)
            .scaleEffect(scale)
            .animation(
                isActive
                ? .easeInOut(duration: 60.0 / bpm).repeatForever(autoreverses: true)
                : .default,
                value: scale
            )
            .onAppear {
                if isActive { scale = 1.25 }
            }
            .onChange(of: isActive) { _, active in
                scale = active ? 1.25 : 1.0
            }
    }
}

import SwiftUI

struct SwipeHintView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "chevron.left")
                .font(.callout.weight(.semibold))
                .foregroundStyle(.primary.opacity(0.7))

            Text("Swipe to continue")
                .font(.callout.weight(.medium))
                .foregroundStyle(.primary)

            Image(systemName: "chevron.right")
                .font(.callout.weight(.semibold))
                .foregroundStyle(.primary.opacity(0.7))
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.thinMaterial)
        }
        .shadow(color: .black.opacity(0.08), radius: 6, y: 2)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Swipe left or right to continue")
        .allowsHitTesting(false)
    }
}

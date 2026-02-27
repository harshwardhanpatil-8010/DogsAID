import SwiftUI

struct DisclaimerView: View {
    let onContinue: () -> Void

    @ScaledMetric private var rowSpacing: CGFloat = 24
    @ScaledMetric private var iconSize: CGFloat = 28
    @ScaledMetric private var iconWidth: CGFloat = 34
    @ScaledMetric private var rowInnerSpacing: CGFloat = 14

    private struct DisclaimerPoint: Identifiable {
        let id = UUID()
        let icon: String
        let title: String
        let body: String
    }

    private let points: [DisclaimerPoint] = [
        DisclaimerPoint(
            icon: "pawprint.fill",
            title: "For Dogs Only",
            body: "All guidance in this app is written specifically for dogs and their emergencies."
        ),
        DisclaimerPoint(
            icon: "staroflife.fill",
            title: "First Aid Guidance Only",
            body: "This app provides emergency first aid steps — not diagnosis or medical treatment."
        ),
        DisclaimerPoint(
            icon: "cross.case.fill",
            title: "Not a Substitute for a Vet",
            body: "Always contact a licensed veterinarian as soon as possible in any emergency."
        ),
        DisclaimerPoint(
            icon: "iphone.slash",
            title: "Works Offline",
            body: "All content is available without an internet connection, always ready when you need it."
        )
    ]

    var body: some View {
        VStack(spacing: 0) {

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    Text("Welcome to DogsAID")
                        .font(.title2.bold())
                        .padding(.top, 32)
                        .padding(.horizontal, 24)
                        .padding(.bottom, rowSpacing)

                    VStack(alignment: .leading, spacing: rowSpacing) {
                        ForEach(points) { point in
                            HStack(alignment: .top, spacing: rowInnerSpacing) {
                                Image(systemName: point.icon)
                                    .font(.system(size: iconSize))
                                    .foregroundStyle(.primary)
                                    .frame(width: iconWidth)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(point.title)
                                        .font(.headline)

                                    Text(point.body)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer(minLength: 32)
                }
            }

            Button {
                onContinue()
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.blue)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }
}

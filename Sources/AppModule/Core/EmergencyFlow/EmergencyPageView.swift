import SwiftUI

// MARK: - EmergencyPageView

struct EmergencyPageView<Step: EmergencyStep, InteractiveContent: View>: View {

    let step: Step
    let stepNumber: Int
    let totalSteps: Int
    var isPageVisible: Bool = false

    @ViewBuilder private let interactiveContent: () -> InteractiveContent

    // MARK: Init — with interactive content

    init(
        step: Step,
        stepNumber: Int,
        totalSteps: Int,
        isPageVisible: Bool = false,
        @ViewBuilder interactiveContent: @escaping () -> InteractiveContent
    ) {
        self.step = step
        self.stepNumber = stepNumber
        self.totalSteps = totalSteps
        self.isPageVisible = isPageVisible
        self.interactiveContent = interactiveContent
    }

    // MARK: Body

    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {

                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        step.illustrationColor.opacity(0.70),
                                        Color(red: 0.10, green: 0.14, blue: 0.25)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )

                        if step.isInteractive {
                            interactiveContent()
                                .padding(.vertical, 16)
                        } else if let icon = step.illustrationIcon {
                            Image(systemName: icon)
                                .font(.system(size: 90, weight: .thin))
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(
                        width: geo.size.width - 32,
                        height: step.isInteractive
                            ? geo.size.height * 0.62
                            : geo.size.height * 0.50
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 24)

                    Text(step.title)
                        .font(.system(size: 28, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)

                    Text(markdownText(step.instruction))
                        .font(.system(size: 17))
                        .lineSpacing(3)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)

                    if let guidance = step.sizeGuidance {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "pawprint")
                                Text(guidance.smallDog)
                            }
                            HStack {
                                Image(systemName: "pawprint.fill")
                                Text(guidance.largeDog)
                            }
                        }
                        .font(.system(size: 16))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }

                    // REMOVED: Step counter text
                    // Text("Step \(stepNumber) of \(totalSteps)")

                    Spacer(minLength: 60)
                }
            }
        }
    }

    // MARK: - Markdown helper

    private func markdownText(_ string: String) -> AttributedString {
        (try? AttributedString(markdown: string)) ?? AttributedString(string)
    }
}

// MARK: - Convenience init — no interactive content

extension EmergencyPageView where InteractiveContent == EmptyView {
    init(
        step: Step,
        stepNumber: Int,
        totalSteps: Int,
        isPageVisible: Bool = false
    ) {
        self.init(
            step: step,
            stepNumber: stepNumber,
            totalSteps: totalSteps,
            isPageVisible: isPageVisible
        ) {
            EmptyView()
        }
    }
}

import SwiftUI

struct HitByCarView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "SECURE THE SCENE",
            instruction: "Ensure the area is safe from traffic. Approach the dog slowly from the front to avoid startling them.",
            audio: "Make sure the area is safe. Approach the dog slowly and calmly.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        ),
        InfoStep(
            title: "SPINE SAFETY",
            instruction: "Slide the dog onto a flat board or use a blanket as a stretcher to prevent spinal movement.",
            audio: "Use a flat board or a blanket to move the dog. Keep the spine as straight as possible.",
            illustrationIcon: "figure.wave.circle",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "CONTROL BLEEDING",
            instruction: "Apply firm, direct pressure to any visible wounds with a clean cloth. " +
            "Do not lift the cloth to check.",
            audio: "Apply firm pressure to any bleeding wounds.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.82, green: 0.22, blue: 0.28)
        ),
        InfoStep(
            title: "MANAGE SHOCK",
            instruction: "Keep the dog warm with a blanket. Keep their head slightly lower than the rest of their body.",
            audio: "Keep the dog warm with a blanket and keep their head low.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "Internal injuries are often invisible. Transport the dog to a trauma center immediately.",
            audio: "Drive to the vet immediately. Internal injuries are a major risk.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.65, green: 0.15, blue: 0.85)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Hit By Car",
            paginationAccentColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        )
    }
}

struct HitByCarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HitByCarView()
        }
    }
}

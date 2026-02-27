import SwiftUI

struct BreathingDifficultyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "Stay Calm",
            instruction: "Remain calm and keep your dog relaxed. " +
                         "Anxiety can worsen coughing or gagging. Speak softly and avoid sudden movements.",
            audio: "Stay calm and keep your dog relaxed.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.90, green: 0.60, blue: 0.10)
        ),
        InfoStep(
            title: "Observe Breathing",
            instruction: "Watch closely to see if your dog can breathe normally. " +
                         "Occasional coughing is different from constant distress. " +
                         "If your dog is collapsing, turning blue, or unable to breathe, treat this as an emergency.",
            audio: "Observe your dog’s breathing carefully.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "Check the Mouth",
            instruction: "If your dog allows, gently open the mouth and look for visible objects, foam, or swelling. " +
                         "Do not force the mouth open or insert fingers blindly.",
            audio: "Check your dog’s mouth only if it is safe to do so.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "Allow Coughing",
            instruction: "If your dog is coughing but still breathing, allow them to continue coughing. " +
                         "Coughing is often the body’s way of clearing irritation.",
            audio: "If your dog is breathing, allow coughing to continue.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "Contact the Vet",
            instruction: "If coughing or gagging persists, worsens, or is accompanied by lethargy or collapse, " +
                         "contact your veterinarian immediately.",
            audio: "Contact your veterinarian if symptoms continue or worsen.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Breathing Difficulty",
            paginationAccentColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        )
    }
}

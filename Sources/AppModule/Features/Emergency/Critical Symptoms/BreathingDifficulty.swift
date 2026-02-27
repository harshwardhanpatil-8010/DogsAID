import SwiftUI

struct BreathingDifficultyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "REDUCE STRESS",
            instruction: "Keep the dog still and calm. Do not force the dog into any specific position.",
            audio: "Keep your dog very calm. Do not force them to move or change positions.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.90, green: 0.60, blue: 0.10)
        ),
        InfoStep(
            title: "OBSERVE BREATHING",
            instruction: "Watch for labored breathing, gasping, or using the belly to breathe. These are signs of a major emergency.",
            audio: "Watch for gasping or heavy breathing effort.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "CHECK GUM COLOR",
            instruction: "Check if the gums are blue or purple, which indicates a severe lack of oxygen.",
            audio: "Check if the gums are blue or purple.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "ALLOW COUGHING",
            instruction: "If the dog is coughing but still breathing, allow them to continue. Do not reach into the throat.",
            audio: "If the dog can breathe, let them cough.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "SEEK VET CARE",
            instruction: "Labored breathing requires immediate veterinary intervention. Transport the dog to the vet now.",
            audio: "If your dog is struggling to breathe, go to the vet immediately.",
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

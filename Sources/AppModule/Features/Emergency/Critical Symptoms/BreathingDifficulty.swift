import SwiftUI

struct BreathingDifficultyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "OBSERVE THE CHEST",
            instruction: "Watch the chest and abdomen. If the stomach is sucking in and out forcefully " +
            "with every breath, or the nostrils are flaring, this is an EMERGENCY.",
            audio: "Watch the belly. If it is sucking in and out forcefully, your dog is in respiratory distress.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "DO NOT RESTRAIN",
            instruction: "Do not force the dog to lie down or move. Let the dog stay in whatever position " +
            "helps them breathe, usually standing with elbows turned out.",
            audio: "Do not force the dog to move. Let them stand or sit in whatever position is easiest for them.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.90, green: 0.60, blue: 0.10)
        ),
        InfoStep(
            title: "CHECK FOR OBSTRUCTION",
            instruction: "Open the mouth and look into the back of the throat for any toys, balls, or food. " +
            "If you see an object, follow Choking instructions.",
            audio: "Look into the back of the throat for an object. If you see one, follow choking steps.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "KEEP COOL",
            instruction: "Keep the dog cool. High body temperature makes breathing harder. " +
            "Do not wrap them in blankets or hold them tightly.",
            audio: "Keep the dog cool. Do not wrap them in blankets or hold them.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Transport the dog to the vet immediately. Labored breathing " +
            "can lead to sudden heart failure.",
            audio: "Go to the vet immediately. Labored breathing is a life-threatening emergency.",
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

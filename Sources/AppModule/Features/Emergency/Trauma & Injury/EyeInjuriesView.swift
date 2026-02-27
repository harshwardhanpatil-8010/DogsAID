import SwiftUI

struct EyeInjuriesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "PREVENT RUBBING",
            instruction: "Prevent the dog from pawing or rubbing at the eye. " +
            "Use an Elizabethan collar or hold their paws firmly.",
            audio: "Stop the dog from scratching or rubbing their eye.",
            illustrationIcon: "eye.trianglebadge.exclamationmark.fill",
            illustrationColor: Color(red: 0.80, green: 0.20, blue: 0.30)
        ),
        InfoStep(
            title: "FLUSH CHEMICALS",
            instruction: "If a chemical is in the eye, flush with sterile saline or plain water for 15 minutes.",
            audio: "If chemicals got into the eye, flush it with water for fifteen minutes.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.25, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "KEEP EYE MOIST",
            instruction: "If the eye is bulging or the eyelid cannot close, " +
            "gently apply sterile saline or clean water to keep it moist.",
            audio: "Keep the eye moist with saline or clean water.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.60, green: 0.40, blue: 0.70)
        ),
        InfoStep(
            title: "SHIELD THE EYE",
            instruction: "Loosely cover the eye with a clean, damp cloth. DO NOT apply any pressure to the eyeball.",
            audio: "Loosely cover the eye without applying any pressure.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.55)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "Eye injuries can lead to permanent blindness within hours. " +
            "Transport the dog to the vet immediately.",
            audio: "Drive to the vet immediately to save the dog's vision.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Eye Injuries",
            paginationAccentColor: Color(red: 0.80, green: 0.20, blue: 0.30)
        )
    }
}

struct EyeInjuriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EyeInjuriesView()
        }
    }
}

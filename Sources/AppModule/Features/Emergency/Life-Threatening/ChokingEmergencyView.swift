import SwiftUI

struct InfoStep: Identifiable, EmergencyStep {
    let id = UUID()
    let title: String
    let instruction: String
    let audio: String
    let illustrationIcon: String?
    let illustrationColor: Color
    var sizeGuidance: SizeGuidance?
    var isInteractive: Bool { false }
}

struct ChokingEmergencyView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Choking",
            instruction: "Extreme distress, violent coughing, gagging, blue gums, weak/no air movement. " +
                        "Small dogs: panicked pawing at mouth. Large dogs: collapse.",
            audio: "Extreme coughing, blue gums, no air movement equals choking emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "Check Mouth Safely",
            instruction: "Gently restrain. Open mouth wide, pull tongue forward. " +
                        "Remove visible objects with fingers/tweezers ONLY if clearly grasped. " +
                        "Never blind sweep—pushes object deeper.",
            audio: "Open mouth carefully. Remove only visible objects you can grasp.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "Heimlich Maneuver",
            instruction: "Head down. 5 sharp blows between shoulder blades with flat hand. " +
                        "Check mouth. Repeat 5 blows. Alternate with 5 abdominal thrusts.",
            audio: "Head down. Five sharp shoulder blows, check mouth, repeat.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Abdominal Thrusts",
            instruction: "Small dogs: Back against chest, thrust upward behind ribs. " +
                        "Large dogs: Behind dog, fist thrusts upward under ribs. " +
                        "5 thrusts → check mouth → repeat cycle.",
            audio: "Small dogs against chest. Large dogs behind. Five upward rib thrusts.",
            illustrationIcon: "figure.strengthtraining.traditional",
            illustrationColor: Color(red: 0.70, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "CPR if Unconscious",
            instruction: "No breathing/heartbeat → lay right side down → 30 chest compressions (100-120/min) → 2 breaths. " +
                        "Small: Thumb/fingers opposite chest. Large: Both hands.",
            audio: "No pulse equals CPR. Thirty compressions, two breaths. Repeat immediately.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Emergency Vet NOW",
            instruction: "ALWAYS vet visit post-choking. Throat swelling/injury invisible. " +
                        "X-rays confirm airway clear. Call ahead.",
            audio: "Emergency vet visit required even if resolved. Call ahead.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Choking",
            paginationAccentColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        )
    }
}

struct DogChokingEmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChokingEmergencyView()
        }
    }
}

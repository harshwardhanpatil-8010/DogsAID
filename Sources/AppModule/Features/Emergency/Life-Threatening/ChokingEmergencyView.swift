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
            title: "RECOGNIZE CHOKING",
            instruction: "Look for violent coughing, gasping, or blue gums. If the dog is coughing loudly " +
            "and moving air, do not touch them; let them cough the object out. If they cannot breathe, " +
            "proceed immediately.",
            audio: "Look for violent coughing or blue gums. If the dog can breathe, let them cough. " +
            "If they cannot breathe, act now.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "OPEN THE MOUTH",
            instruction: "Grasp the upper jaw with one hand and the lower jaw with the other. Pull the mouth " +
            "open wide. Look at the back of the throat for a visible object. DO NOT reach blindly into " +
            "the throat with your fingers.",
            audio: "Pull the jaws apart and look into the back of the throat. Do not reach blindly into the throat.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "BACK BLOWS",
            instruction: "Use the heel of your hand to deliver 5 sharp, rapid blows between the shoulder blades. " +
            "Strike in a forward direction toward the dog's head to dislodge the object.",
            audio: "Use the heel of your hand to strike five sharp blows between the shoulder blades, " +
            "hitting forward toward the head.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "HEIMLICH MANEUVER",
            instruction: "Stand behind the dog and wrap your arms around their waist. Place a fist just " +
            "behind the last rib in the soft center of the belly. Pull your hands up and forward toward " +
            "the head in 5 sharp thrusts.",
            audio: "Wrap your arms around the waist. Place a fist behind the last rib and pull up " +
            "and forward sharply five times.",
            illustrationIcon: "figure.strengthtraining.traditional",
            illustrationColor: Color(red: 0.70, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "CHECK FOR PULSE",
            instruction: "If the dog collapses, slide your fingers into the area behind the left elbow " +
            "to feel for a heartbeat. If no pulse is felt and the dog is not breathing, start CPR immediately.",
            audio: "If the dog collapses, feel for a heartbeat behind the left elbow. If none, start CPR immediately.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "EMERGENCY VET NOW",
            instruction: "EMERGENCY. Drive to the vet immediately even if the object is removed. Internal " +
            "throat swelling can close the airway minutes after the object is gone.",
            audio: "Drive to the emergency vet now. Internal throat damage is a major risk.",
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

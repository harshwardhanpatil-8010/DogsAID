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
            instruction: "Look for violent coughing, gasping, or blue gums. " +
            "If the dog is still moving air, let them cough.",
            audio: "Look for violent coughing or blue gums. If the dog can breathe, let them cough.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "INSPECT THE MOUTH",
            instruction: "Open the mouth and look for an object. " +
            "NEVER perform a blind finger sweep as you may push the object deeper.",
            audio: "Open the mouth and look for an object. Do not reach blindly into the throat.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "BACK BLOWS",
            instruction: "Use the heel of your hand to deliver 4-5 sharp blows between the shoulder blades.",
            audio: "Use the heel of your hand to deliver five sharp blows between the shoulder blades.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "HEIMLICH MANEUVER",
            instruction: "Wrap arms around the waist. Pull up and forward sharply just behind the ribs.",
            audio: "Wrap your arms around the waist. Pull up and forward sharply just behind the ribs.",
            illustrationIcon: "figure.strengthtraining.traditional",
            illustrationColor: Color(red: 0.70, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "CHECK FOR PULSE",
            instruction: "If the dog collapses and stops breathing, begin CPR immediately.",
            audio: "If the dog collapses and stops breathing, start CPR immediately.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "EMERGENCY VET NOW",
            instruction: "Seek vet care immediately even if the object is removed. " +
            "Throat swelling or damage is invisible.",
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

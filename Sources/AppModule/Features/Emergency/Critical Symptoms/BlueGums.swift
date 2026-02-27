import SwiftUI

struct BlueGumsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "INSPECT THE GUMS",
            instruction: "Lift the dog's upper lip. If the gums or tongue look blue, purple, or grey, " +
            "the dog is suffocating. This is a critical EMERGENCY.",
            audio: "Lift the lip. If the gums are blue, purple, or grey, your dog is suffocating. " +
            "This is an emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "CLEAR THE COLLAR",
            instruction: "Use your hands to immediately remove any collar, harness, or clothing from " +
            "the dog's neck and chest. Ensure nothing is pressing on the throat.",
            audio: "Remove the collar and harness immediately. Ensure nothing is pressing on the throat.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "POSITION THE HEAD",
            instruction: "Pull the dog's head and neck forward into a straight line. Gently pull the " +
            "tongue forward to the side of the mouth to ensure the airway is clear.",
            audio: "Straighten the head and neck. Pull the tongue forward and to the side.",
            illustrationIcon: "figure.walk.circle.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "PROVIDE FRESH AIR",
            instruction: "Move the dog to an open window or outside. Use a fan or the car's " +
            "air conditioning to blow air directly at the dog's nose.",
            audio: "Get the dog to fresh air. Blow a fan or air conditioning directly at their nose.",
            illustrationIcon: "wind",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "TRANSPORT FOR OXYGEN",
            instruction: "EMERGENCY. Drive to the vet immediately. Keep the dog completely still; " +
            "any movement increases their need for oxygen and worsens the crisis.",
            audio: "Drive to the vet now for oxygen. Keep the dog perfectly still during the drive.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Blue Gums (Oxygen Crisis)",
            paginationAccentColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    }
}

struct BlueGumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BlueGumsView()
        }
    }
}

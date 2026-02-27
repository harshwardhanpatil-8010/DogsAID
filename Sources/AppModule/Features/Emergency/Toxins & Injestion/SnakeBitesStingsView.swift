import SwiftUI

struct SnakeBitesStingsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "IDENTIFY BITE SITE",
            instruction: "Look for two puncture wounds, rapid swelling, and bleeding. Snake bites " +
            "usually occur on the face, neck, or front legs.",
            audio: "Look for two puncture wounds and fast swelling on the face or legs.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "KEEP THE BITE LOW",
            instruction: "Keep the bitten body part below the level of the heart. This slows " +
            "the spread of venom through the bloodstream.",
            audio: "Keep the bite area lower than the heart to slow the venom.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "CARRY THE DOG",
            instruction: "Pick the dog up and carry them to the car. DO NOT let them walk. " +
            "Movement and muscle contractions pump the venom faster.",
            audio: "Carry the dog to the car. Do not let them walk.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "DO NOT CUT OR SUCK",
            instruction: "DO NOT cut the wound, DO NOT try to suck out venom, and DO NOT apply " +
            "a tourniquet. These actions increase the risk of amputation.",
            audio: "Do not cut the wound or try to suck out venom. Do not use a tourniquet.",
            illustrationIcon: "scissors",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY ANTIVENOM",
            instruction: "EMERGENCY. Drive to the vet immediately. Snake venom causes the blood " +
            "to stop clotting and destroys muscle tissue within minutes.",
            audio: "Drive to the vet now for antivenom. Minutes matter.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Snake Bites & Stings",
            paginationAccentColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        )
    }
}

struct SnakeBitesStingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SnakeBitesStingsView()
        }
    }
}

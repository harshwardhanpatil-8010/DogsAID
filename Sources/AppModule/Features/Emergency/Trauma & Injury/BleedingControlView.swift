
import SwiftUI

struct BleedingControlView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "APPLY PRESSURE",
            instruction: "Use a clean cloth or bandage to apply firm, direct pressure to the wound for 5 minutes. DO NOT lift the cloth to check.",
            audio: "Use a clean cloth to apply firm pressure to the wound for five minutes.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "ELEVATE WOUND",
            instruction: "If the wound is on a limb, try to keep it elevated above the heart to slow blood flow.",
            audio: "If the wound is on a leg, try to keep it raised.",
            illustrationIcon: "arrow.up.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "BANDAGE SNUGLY",
            instruction: "Wrap a bandage over the pressure cloth. Ensure it is snug but not tight enough to cut off circulation.",
            audio: "Wrap a bandage snugly over the wound.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "CHECK FOR SHOCK",
            instruction: "Look for pale gums, rapid breathing, or weakness. These are signs of life-threatening blood loss.",
            audio: "Watch for pale gums or rapid breathing.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "Transport the dog to the vet immediately. Do not wait for the bleeding to stop completely if it is severe.",
            audio: "Drive to the vet immediately for professional wound care.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Bleeding Control",
            paginationAccentColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    }
}

struct BleedingControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BleedingControlView()
        }
    }
}

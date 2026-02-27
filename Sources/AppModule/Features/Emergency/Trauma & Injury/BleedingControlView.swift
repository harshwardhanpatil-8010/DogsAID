
import SwiftUI

struct BleedingControlView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Assess Bleeding Severity",
            instruction: "Check for arterial (spurting, bright red) vs. venous (steady flow, dark red) bleeding. " +
                        "Pale gums, rapid breathing, or weakness indicate internal bleeding—emergency vet NOW.",
            audio: "Assess bleeding type and check for shock signs.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Direct Firm Pressure",
            instruction: "Apply clean gauze or cloth directly to wound with FIRM pressure for 10+ minutes. " +
                        "Do NOT peek or lift to check—constant pressure stops most bleeding.",
            audio: "Apply firm pressure with gauze for 10 minutes minimum.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Elevate if Possible",
            instruction: "If no fracture suspected, elevate the bleeding limb above heart level. " +
                        "Continue firm pressure while elevating.",
            audio: "Elevate limb above heart level if no fracture.",
            illustrationIcon: "arrow.up.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Bandage Snugly",
            instruction: "Wrap gauze snugly (not tourniquet-tight) over pressure dressing. " +
                        "Check circulation: toes should stay warm/pink, not blue/cold.",
            audio: "Bandage snugly but check circulation every 10 minutes.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Monitor & Transport",
            instruction: "Watch for shock signs (pale gums, rapid breathing). " +
                        "Transport to emergency vet immediately—do NOT wait for bleeding to stop completely.",
            audio: "Monitor for shock and seek emergency vet care immediately.",
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

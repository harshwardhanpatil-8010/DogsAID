

import SwiftUI

struct HitByCarView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "SECURE THE SCENE",
            instruction: "Traffic control. Move dog safely off road using blanket. " +
                        "Approach slowly from behind if panicked.",
            audio: "Secure scene first. Move dog safely off road.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        ),
        InfoStep(
            title: "DO NOT MOVE if Spine Injury",
            instruction: "Paralysis, dragging legs, yelping on touch = suspect spine. " +
                        "Blanket stretcher, keep spine straight.",
            audio: "Suspect spine injury. Use blanket stretcher.",
            illustrationIcon: "figure.wave.circle",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Control Bleeding",
            instruction: "Direct pressure on arterial bleeding (spurting). Elevate if no fracture. " +
                        "Pressure points: femoral/groin artery.",
            audio: "Control bleeding with direct pressure.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.82, green: 0.22, blue: 0.28)
        ),
        InfoStep(
            title: "Stabilize Fractures",
            instruction: "Splint long bones (stick between legs). Do NOT realign. Towel sling for pelvis.",
            audio: "Splint obvious fractures. Do not realign.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "VET TRAUMA CENTER",
            instruction: "**SHOCK common.** IV fluids, pain meds, x-rays, surgery. " +
                        "Internal bleeding invisible.",
            audio: "Trauma center immediately. Internal injuries likely.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.65, green: 0.15, blue: 0.85)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Hit By Car",
            paginationAccentColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        )
    }
}

struct HitByCarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HitByCarView()
        }
    }
}


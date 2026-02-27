import SwiftUI

struct FracturesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "ASSESS INJURY",
            instruction: "Look for limping, swelling, or a visible deformity. " +
            "Check if the leg dangles abnormally or won't bear weight.",
            audio: "Check for limping, swelling, or abnormal leg position.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "IMMOBILIZE",
            instruction: "Prevent the dog from moving the injured limb. Do not attempt to \"reset\" the bone.",
            audio: "Prevent the dog from moving the injured leg. Do not try to fix the bone yourself.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "MUZZLE IF NEEDED",
            instruction: "Even gentle dogs may bite when in severe pain. " +
            "Muzzle if it does not interfere with breathing.",
            audio: "Use a muzzle if the dog is in pain, but only if they can breathe easily.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "PREVENT DAMAGE",
            instruction: "Carry the dog or use a sling to prevent them from putting weight on the injury. " +
            "No jumping or stairs.",
            audio: "Carry the dog to the car. Do not let them walk on the injury.",
            illustrationIcon: "hand.point.up.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "CHECK FOR BLEEDING",
            instruction: "If the bone has broken the skin, apply a clean bandage loosely to prevent contamination.",
            audio: "If there is an open wound, cover it loosely with a clean cloth.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "All fractures require X-rays and professional treatment immediately. Drive to the vet now.",
            audio: "Go to the vet immediately for X-rays and pain relief.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.88, green: 0.25, blue: 0.25)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Fractures & Sprains",
            paginationAccentColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        )
    }
}

struct FracturesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FracturesView()
        }
    }
}

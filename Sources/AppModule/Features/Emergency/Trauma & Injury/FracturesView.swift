
import SwiftUI

struct FracturesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Assess Injury Severity",
            instruction: "Look for limping, swelling, pain when touched, or visible deformity. " +
                        "Check if leg dangles abnormally or won't bear weight.",
            audio: "Check for limping, swelling, or abnormal leg position.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "Immobilize Immediately",
            instruction: "Keep dog calm and still. Use rolled towel/splint along injured leg. " +
                        "Secure with gauze/vet wrap from toes to above joint (not tourniquet tight).",
            audio: "Immobilize leg with towel and gauze immediately.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Check Circulation",
            instruction: "Toes should stay pink/warm. If blue/cold/numb = loosen bandage. " +
                        "Check every 10 minutes during transport.",
            audio: "Monitor toe color and temperature every 10 minutes.",
            illustrationIcon: "hand.point.up.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Prevent Further Damage",
            instruction: "Carry small dogs. Support large dogs with sling under chest/pelvis. " +
                        "No jumping, stairs, or running. Crate confinement ideal.",
            audio: "Carry or support dog. Prevent jumping or running.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "X-rays & Surgery Needed",
            instruction: "All fractures need vet X-rays immediately. Treatment: splint, pins, plates, or surgery. " +
                        "Pain meds + antibiotics for open fractures.",
            audio: "Veterinary X-rays and surgery usually required.",
            illustrationIcon: "stethoscope",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Recovery (6-12 Weeks)",
            instruction: "Strict rest 8-12 weeks. Physical therapy after 4 weeks. " +
                        "Monitor for swelling, odor, or bandage slippage.",
            audio: "Expect 8-12 weeks recovery with strict rest.",
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

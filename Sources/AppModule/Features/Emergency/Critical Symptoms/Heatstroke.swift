
import SwiftUI

struct HeatstrokeView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "EMERGENCY: Cool IMMEDIATELY",
            instruction: "Move to shade/AC. Wet body (NOT head) with **COOL** water. " +
                        "Fan blowing. Wet groin/armpits/ears/paws.",
            audio: "Cool immediately with cool water and fan. Avoid head.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.98, green: 0.45, blue: 0.10)
        ),
        InfoStep(
            title: "Cool Water Only",
            instruction: "**COOL tap water** (NOT ice/cold). Soak towels, replace often. " +
                        "Ice causes shock. Alcohol dangerous.",
            audio: "Cool tap water only. No ice or alcohol.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Monitor Temperature",
            instruction: "Rectal temp >104°F = severe. Goal: <103°F. " +
                        "Continue cooling until 103°F, then transport.",
            audio: "Cool until under 103 degrees. Then go to vet.",
            illustrationIcon: "thermometer.high",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Small Water Sips",
            instruction: "Offer ice chips/small sips ONLY if alert. " +
                        "No gulping/large volumes.",
            audio: "Small water sips only if conscious.",
            illustrationIcon: "cup.and.saucer.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "VET EMERGENCY NOW",
            instruction: "**>104°F = organ damage.** Internal bleeding/coagulation failure. " +
                        "IV fluids/antibiotics/shock treatment required.",
            audio: "Veterinary emergency immediately. Organ damage occurring.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.98, green: 0.25, blue: 0.10)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Heatstroke",
            paginationAccentColor: Color(red: 0.98, green: 0.45, blue: 0.10)
        )
    }
}

struct HeatstrokeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HeatstrokeView()
        }
    }
}

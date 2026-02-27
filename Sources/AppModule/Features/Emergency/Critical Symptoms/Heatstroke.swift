
import SwiftUI

struct HeatstrokeView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "MOVE TO SHADE",
            instruction: "Immediately move the dog to a cool, shaded area. Use a fan if possible.",
            audio: "Move your dog to a cool, shaded area immediately.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.98, green: 0.45, blue: 0.10)
        ),
        InfoStep(
            title: "COOL GENTLY",
            instruction: "Soak the coat with lukewarm water. DO NOT use ice or freezing water as it causes dangerous shock.",
            audio: "Wet the fur with lukewarm water. Do not use ice or freezing water.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "TARGET TEMPERATURE",
            instruction: "Aim to cool the dog until their temperature reaches 103°F. Stop active cooling once this target is reached.",
            audio: "Cool the dog until their temperature is 103 degrees, then stop.",
            illustrationIcon: "thermometer.high",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "SMALL SIPS ONLY",
            instruction: "Offer small sips of water or ice chips ONLY if the dog is alert. Do not force them to drink.",
            audio: "Give small sips of water only if the dog is conscious.",
            illustrationIcon: "cup.and.saucer.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "VET CARE MANDATORY",
            instruction: "Even if the dog seems better, internal organ damage is likely. Professional vet care is mandatory.",
            audio: "You must see a vet immediately. Internal damage can be fatal even if the dog looks better.",
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

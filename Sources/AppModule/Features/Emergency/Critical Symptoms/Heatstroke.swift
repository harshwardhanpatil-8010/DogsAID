import SwiftUI

struct HeatstrokeView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "MOVE TO SHADE",
            instruction: "Immediately carry the dog to a cool, shaded area or into an " +
            "air-conditioned room. Place them on a cool floor (tile or concrete).",
            audio: "Carry the dog to a cool, shaded area or air-conditioned room immediately.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.98, green: 0.45, blue: 0.10)
        ),
        InfoStep(
            title: "COOL WITH WATER",
            instruction: "Pour lukewarm water over the dog's back, neck, and head. Use a fan to " +
            "blow air over their wet fur. DO NOT use ice-cold water, as it causes blood vessels " +
            "to shrink and traps heat.",
            audio: "Pour lukewarm water over the back and neck. Use a fan to cool the wet fur. Do not use ice.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "WET THE PAW PADS",
            instruction: "Apply cool water directly to the pads of the paws and the groin area " +
            "(between the back legs), as these areas release heat quickly.",
            audio: "Put cool water on the paw pads and between the back legs.",
            illustrationIcon: "thermometer.high",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "MONITOR TEMP",
            instruction: "Stop cooling the dog once their rectal temperature reaches 103°F (39.5°C). " +
            "Over-cooling can lead to hypothermia.",
            audio: "Stop cooling once the dog's temperature hits 103 degrees.",
            illustrationIcon: "cup.and.saucer.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet now. Heatstroke causes internal organs " +
            "to \"cook\" and bleed. The dog may look fine but die of organ failure hours later.",
            audio: "Drive to the vet immediately. Internal organs can fail even if the dog looks better.",
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

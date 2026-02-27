import SwiftUI

struct TemperatureBurnsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "FLUSH WITH COOL WATER",
            instruction: "Hold the burned area under cool (not cold) running water for 20 minutes. " +
            "This pulls the heat out of the skin and stops the burning process.",
            audio: "Run cool water over the burn for twenty minutes. This stops the skin from continuing to burn.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "REMOVE COLLARS",
            instruction: "If the burn is on the neck or chest, remove the collar immediately. " +
            "Burned skin swells rapidly and the collar will become a choking hazard.",
            audio: "Remove the collar immediately. Burned skin will swell and the collar will choke the dog.",
            illustrationIcon: "xmark.octagon.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "NO OINTMENTS",
            instruction: "DO NOT apply butter, grease, or antibiotic ointments to the burn. " +
            "These trap the heat inside the skin and cause the burn to go deeper.",
            audio: "Do not put butter or ointment on the burn. It traps the heat and makes the injury worse.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "COVER WITH WET CLOTH",
            instruction: "Loosely lay a clean, soaking-wet cloth over the burn. DO NOT wrap it tightly " +
            "and DO NOT use cotton balls or materials that stick to the wound.",
            audio: "Lay a soaking-wet cloth over the burn. Do not wrap it tightly.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet now. Burns cause massive fluid loss and " +
            "high risk of infection. Large burns require immediate IV fluids.",
            audio: "Drive to the vet now. Large burns cause dangerous fluid loss and infection.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Temperature & Burns",
            paginationAccentColor: Color(red: 0.90, green: 0.35, blue: 0.25)
        )
    }
}

struct TemperatureBurnsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TemperatureBurnsView()
        }
    }
}

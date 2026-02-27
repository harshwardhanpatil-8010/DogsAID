
import SwiftUI

struct TemperatureBurnsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "COOL WATER FLUSH",
            instruction: "Flush the burn with cool (not cold) running water for 10–20 minutes.",
            audio: "Flush the burn with cool running water for at least ten minutes.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "NO OINTMENTS",
            instruction: "DO NOT apply butter, oils, or ointments to the burn. These trap heat and worsen the injury.",
            audio: "Do not apply any creams or oils. Cover the area with a clean, damp cloth.",
            illustrationIcon: "xmark.octagon.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "COVER LOOSELY",
            instruction: "Cover the burn loosely with a clean, damp cloth or sterile gauze. Do not wrap it tightly.",
            audio: "Cover the burn loosely with a clean, damp cloth.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "PREVENT LICKING",
            instruction: "Do not let the dog lick or bite at the burned area. Use a muzzle or Elizabethan collar if necessary.",
            audio: "Stop the dog from licking or biting the burn.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "All major burns require immediate veterinary treatment for pain relief and to prevent infection.",
            audio: "Drive to the vet immediately for professional burn care.",
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

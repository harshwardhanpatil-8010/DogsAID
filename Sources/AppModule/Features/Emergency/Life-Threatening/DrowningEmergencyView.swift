import SwiftUI

struct DrowningEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "REMOVE FROM WATER",
            instruction: "Remove your dog from the water immediately. Place them on a flat, firm surface.",
            audio: "Remove your dog from the water immediately and place them on a flat surface.",
            illustrationIcon: "drop.triangle.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "CLEAR AIRWAY",
            instruction: "Lift the dog's hind legs for 15-20 seconds to drain water from the lungs.",
            audio: "Lift the dog's back legs for twenty seconds to help drain water from the lungs.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "CHECK BREATHING",
            instruction: "If the dog is not breathing, begin CPR immediately. " +
            "Check for a pulse behind the left elbow.",
            audio: "If the dog is not breathing, start CPR now.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "PROVIDE BREATHS",
            instruction: "Close the dog's mouth and breathe into the nose until the chest rises. " +
            "Give 2 breaths every 30 compressions.",
            audio: "Hold the muzzle closed and breathe into the nose.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "Even if the dog seems fine, secondary drowning can occur later. Go to the vet immediately.",
            audio: "Go to the vet immediately as water in the lungs can cause issues hours later.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Drowning",
            paginationAccentColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        )
    }
}

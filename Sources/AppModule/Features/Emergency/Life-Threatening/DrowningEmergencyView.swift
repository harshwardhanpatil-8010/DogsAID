import SwiftUI

struct DrowningEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "REMOVE FROM WATER",
            instruction: "Pull the dog out of the water immediately. Place them on their side on a " +
            "flat, firm surface. Keep the head lower than the chest.",
            audio: "Remove the dog from the water and place them on their side with the head lower than the chest.",
            illustrationIcon: "drop.triangle.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "DRAIN THE LUNGS",
            instruction: "For small dogs, hold them by the hind legs with the head hanging down for " +
            "15 seconds. For large dogs, lay them on their side and lift the hindquarters upward " +
            "to let water drain from the mouth.",
            audio: "Lift the dog's back legs up for fifteen seconds to drain water out of the mouth and lungs.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "CLEAR THE MOUTH",
            instruction: "Open the mouth and clear any debris, seaweed, or vomit using your fingers. " +
            "Ensure the tongue is pulled forward to keep the airway open.",
            audio: "Clear the mouth of any debris and pull the tongue forward.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "MOUTH-TO-NOSE BREATHS",
            instruction: "Close the dog's mouth tightly with your hands. Place your mouth over " +
            "the dog's nose and blow until you see the chest rise. Give 2 breaths, then check " +
            "for a pulse behind the left elbow.",
            audio: "Hold the mouth closed and blow into the nose until the chest rises. Give two breaths.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Go to the vet immediately even if the dog is breathing. " +
            "\"Secondary drowning\" can cause the lungs to fill with fluid hours later.",
            audio: "Go to the vet now. Lungs can fill with fluid hours later, which is fatal.",
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

import SwiftUI

struct FoodPoisoningView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "IDENTIFY THE TOXIN",
            instruction: "Check for chocolate, grapes, raisins, onions, garlic, or sugar-free gum (Xylitol). " +
            "Check the trash for wrappers or missing food.",
            audio: "Check for chocolate, grapes, onions, or sugar-free gum. Look in the trash for wrappers.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "SAVE THE LABEL",
            instruction: "Grab the food packaging or the ingredient list. The vet needs to know the exact " +
            "percentage of cocoa or the presence of Xylitol to calculate the toxic dose.",
            audio: "Take the food packaging with you to the vet. They need the ingredient list.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT make the dog vomit unless a vet specifically tells you to. " +
            "Some foods, like grapes, cause kidney failure that vomiting won't stop.",
            audio: "Do not make the dog vomit unless the vet tells you to.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "CHECK GUM COLOR",
            instruction: "Lift the lip and look at the gums. If they are bright red, pale, or yellow, " +
            "the toxins are already affecting the blood or liver.",
            audio: "Check the gums. If they are bright red, pale, or yellow, go to the vet now.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Transport the dog to the vet immediately. For Xylitol, the dog's " +
            "blood sugar can drop to fatal levels within 30 minutes.",
            audio: "Drive to the vet now. Some toxins work in less than thirty minutes.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Food Poisoning",
            paginationAccentColor: Color(red: 0.85, green: 0.55, blue: 0.15)
        )
    }
}

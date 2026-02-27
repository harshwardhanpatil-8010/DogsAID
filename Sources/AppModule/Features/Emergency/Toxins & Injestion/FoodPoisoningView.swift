import SwiftUI

struct FoodPoisoningView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK FOR TOXICS",
            instruction: "Common toxic foods include grapes, raisins, chocolate, onions, and Xylitol (sweetener).",
            audio: "Check if the dog ate grapes, chocolate, onions, or Xylitol.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "IDENTIFY AMOUNT",
            instruction: "Determine how much was eaten and when. Check the packaging for the ingredient list and weight.",
            audio: "Identify the amount eaten and the time of ingestion.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT induce vomiting unless specifically instructed by a veterinarian. " +
            "Xylitol causes rapid blood sugar drops.",
            audio: "Do not make the dog vomit unless a vet tells you to.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "CALL VET",
            instruction: "Provide the approximate time of ingestion and the amount consumed. " +
            "Have the dog's weight ready.",
            audio: "Call the vet with the time of ingestion and the amount eaten.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "Take your dog to the vet immediately. Bring the food packaging or a sample of the food.",
            audio: "Take your dog to the emergency vet now and bring the packaging.",
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

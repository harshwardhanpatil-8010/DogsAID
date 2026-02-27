import SwiftUI

struct PoisonExposureView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "FLUSH THE SKIN",
            instruction: "If the poison is on the fur or skin, flush the area with lukewarm water and " +
            "mild dish soap for 10 minutes. DO NOT let the dog lick the area.",
            audio: "Wash the skin with lukewarm water and dish soap for ten minutes. Stop the dog from licking.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "SAVE THE CONTAINER",
            instruction: "Grab the bottle, box, or bag of the poison. The vet needs the \"Active Ingredients\" " +
            "list and the EPA registration number from the label.",
            audio: "Take the poison container with you. The vet needs the active ingredient list.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT induce vomiting if the dog swallowed bleach, battery acid, or gasoline. " +
            "These will burn the throat and lungs if vomited.",
            audio: "Do not make the dog vomit if they swallowed chemicals or acid.",
            illustrationIcon: "xmark.octagon.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "CHECK THE EYES",
            instruction: "If the poison is in the eyes, hold the eyelid open and " +
            "flush with plain water for 15 minutes.",
            audio: "If poison is in the eyes, flush them with water for fifteen minutes.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet immediately. Bring the substance container and " +
            "tell the vet exactly how long ago the exposure happened.",
            audio: "Drive to the vet now and bring the poison container.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Poison Exposure",
            paginationAccentColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        )
    }
}

struct DogPoisonExposureEmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PoisonExposureView()
        }
    }
}

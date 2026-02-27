import SwiftUI

struct PoisonExposureView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "REMOVE ACCESS",
            instruction: "Immediately move the dog away from the toxin. Prevent any further ingestion or skin contact.",
            audio: "Move your dog away from the source of poison immediately.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "IDENTIFY TOXIN",
            instruction: "Note the substance name and the amount ingested. Keep the packaging or label to show the vet.",
            audio: "Identify the substance and the amount eaten. Keep the packaging.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT induce vomiting unless specifically instructed by a veterinarian. " +
            "Some toxins cause more damage when vomited.",
            audio: "Do not make the dog vomit unless a vet tells you to. " +
            "Some toxins cause more damage when vomited.",
            illustrationIcon: "xmark.octagon.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "CALL VET OR POISON CONTROL",
            instruction: "Contact your vet or a pet poison hotline immediately. Have the product packaging ready to read.",
            audio: "Call your veterinarian or animal poison control immediately.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "Transport the dog to the vet immediately. Bring the toxin container or a sample of the substance.",
            audio: "Transport your dog to the vet now. Bring the poison container with you.",
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

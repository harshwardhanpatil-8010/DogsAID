
import SwiftUI

struct PoisonExposureView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "Remove Access",
            instruction: "Immediately remove your dog from the source of the poison. " +
                         "Prevent further ingestion or exposure.",
            audio: "Remove your dog from the source of poison immediately.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "Do NOT Induce Vomiting",
            instruction: "Do not induce vomiting unless specifically instructed by a veterinarian or poison control. " +
                         "Some substances cause more damage when vomited.",
            audio: "Do not induce vomiting unless instructed by a veterinarian.",
            illustrationIcon: "xmark.octagon.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "Check Symptoms",
            instruction: "Look for signs such as drooling, vomiting, tremors, seizures, weakness, or collapse. " +
                         "Note what was ingested and when.",
            audio: "Observe your dog for symptoms of poisoning.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "Call Poison Control or Vet",
            instruction: "Contact your veterinarian or an emergency animal poison hotline immediately. " +
                         "Follow their instructions carefully.",
            audio: "Call your veterinarian or animal poison control immediately.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40)
        ),
        InfoStep(
            title: "Emergency Transport",
            instruction: "If advised, transport your dog to an emergency clinic immediately. " +
                         "Bring the poison container or label if possible.",
            audio: "Transport your dog to an emergency clinic as directed.",
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

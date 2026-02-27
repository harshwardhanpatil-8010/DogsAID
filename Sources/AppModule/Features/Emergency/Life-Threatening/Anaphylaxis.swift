

import SwiftUI

struct AnaphylaxisView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK FOR SWELLING",
            instruction: "Look for rapid facial swelling, hives, or sudden collapse. Check for difficulty breathing.",
            audio: "Look for sudden swelling on the face, hives, or collapse. Check if the dog is struggling to breathe.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.75, green: 0.20, blue: 0.75)
        ),
        InfoStep(
            title: "REMOVE STINGER",
            instruction: "If caused by a sting, scrape the stinger away with a credit card. DO NOT use tweezers.",
            audio: "Scrape the stinger away with a credit card. Do not use tweezers.",
            illustrationIcon: "creditcard",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "MONITOR AIRWAY",
            instruction: "Keep the dog's head elevated and monitor breathing closely. Anaphylaxis can close the airway.",
            audio: "Keep the head up and monitor breathing. The airway could close quickly.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "CALL VET NOW",
            instruction: "Transport the dog to the vet immediately for life-saving medication. This is a critical emergency.",
            audio: "Call the vet right now. Your dog needs immediate medication to open the airway.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.75, green: 0.15, blue: 0.75)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Anaphylaxis",
            paginationAccentColor: Color(red: 0.75, green: 0.20, blue: 0.75)
        )
    }
}

struct AnaphylaxisView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnaphylaxisView()
        }
    }
}

import SwiftUI

struct AnaphylaxisView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK FACE & GUMS",
            instruction: "Look for rapid swelling of the muzzle, eyelids, or ears. " +
            "Lift the lip and look at the gums; if they are pale or blue, the airway is closing.",
            audio: "Check for sudden swelling on the face or blue gums. This means the airway is closing.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.75, green: 0.20, blue: 0.75)
        ),
        InfoStep(
            title: "SCRAPE THE STINGER",
            instruction: "If you see a stinger, use the edge of a credit card to scrape it off the skin. " +
            "DO NOT use tweezers, as squeezing the stinger releases more venom.",
            audio: "Scrape the stinger away with a credit card. Do not use tweezers.",
            illustrationIcon: "creditcard",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "ELEVATE THE HEAD",
            instruction: "Keep the dog's head and neck elevated and straight to help them breathe. " +
            "Remove any collars or harnesses that may restrict the swelling neck.",
            audio: "Keep the head up and straight. Remove any collars or harnesses immediately.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "EMERGENCY INJECTION",
            instruction: "EMERGENCY. Drive to the vet immediately. The dog requires an immediate " +
            "injection of epinephrine or antihistamines to prevent total respiratory failure.",
            audio: "Call the vet and drive there now. Your dog needs an immediate injection to breathe.",
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

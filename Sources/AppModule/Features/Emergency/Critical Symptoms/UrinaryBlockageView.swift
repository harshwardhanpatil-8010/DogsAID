import SwiftUI

struct UrinaryBlockageView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "IDENTIFY STRAINING",
            instruction: "Look for frequent, unsuccessful attempts to urinate. This is most common in male dogs.",
            audio: "Look for straining to urinate with no results. This is an emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.80, green: 0.25, blue: 0.30)
        ),
        InfoStep(
            title: "FATAL WARNING",
            instruction: "A complete blockage is fatal within 24–48 hours. Go to the emergency vet immediately.",
            audio: "A urinary blockage is fatal within forty-eight hours. Go to the emergency vet right now.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "KEEP DOG CALM",
            instruction: "Restrict the dog's movement. DO NOT massage the bladder or apply pressure to the abdomen.",
            audio: "Keep your dog calm and still. Do not press on the belly.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "DO NOT TREAT AT HOME",
            instruction: "DO NOT attempt to give medications or home remedies. This is a mechanical blockage that requires professional tools.",
            audio: "Do not attempt home treatment. This requires a veterinarian.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "IMMEDIATE VET CARE",
            instruction: "Emergency catheterization and IV fluids are required immediately to save the dog's life.",
            audio: "Go to an emergency vet immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Urinary Blockage",
            paginationAccentColor: Color(red: 0.80, green: 0.25, blue: 0.30)
        )
    }
}

struct UrinaryBlockageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UrinaryBlockageView()
        }
    }
}

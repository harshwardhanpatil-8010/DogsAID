import SwiftUI

struct UrinaryBlockageView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Urinary Blockage",
            instruction: "Repeated attempts to urinate with little or no output, straining, crying, licking genitals, bloated abdomen. Common in male dogs.",
            audio: "Straining without urination is an emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.80, green: 0.25, blue: 0.30)
        ),
        InfoStep(
            title: "DO NOT Wait",
            instruction: "Complete blockage becomes fatal within 24–48 hours. This is always an emergency.",
            audio: "Do not wait. This condition is fatal without treatment.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "Keep Dog Calm",
            instruction: "Restrict movement. Do not massage bladder or give medications.",
            audio: "Keep your dog calm and still.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Do Not Attempt Home Treatment",
            instruction: "Do not try to catheterize, squeeze bladder, or give fluids at home.",
            audio: "Do not attempt home treatment.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "Immediate Vet Care",
            instruction: "Emergency catheterization, IV fluids, and monitoring are required immediately.",
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

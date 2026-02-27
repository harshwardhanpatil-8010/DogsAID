import SwiftUI

struct BloatView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "RECOGNIZE SYMPTOMS",
            instruction: "Look for a hard, swollen belly and unproductive retching. " +
            "Bloat is 100% fatal without immediate surgery.",
            audio: "Look for a swollen belly and gagging without vomiting. This is a fatal emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.90, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "This is a surgical emergency. Drive to the nearest emergency vet immediately.",
            audio: "This is a surgical emergency. Drive to the nearest emergency veterinarian immediately.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "POSITION THE DOG",
            instruction: "Lay the dog on their right side on a flat surface during transport.",
            audio: "Lay the dog on their right side for the drive to the vet.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "DO NOT DELAY",
            instruction: "DO NOT massage the stomach or induce vomiting. Every minute reduces survival chances.",
            audio: "Do not massage the stomach or induce vomiting. Every minute counts.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.90, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Bloat (GDV)",
            paginationAccentColor: Color(red: 0.90, green: 0.25, blue: 0.25)
        )
    }
}

struct BloatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BloatView()
        }
    }
}

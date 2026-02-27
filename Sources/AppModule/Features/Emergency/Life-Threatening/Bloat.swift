import SwiftUI

struct BloatView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK THE ABDOMEN",
            instruction: "Feel the dog's abdomen just behind the ribs. If the belly feels hard like a drum, " +
            "tight like a basketball, or looks visibly swollen, this is a fatal EMERGENCY.",
            audio: "Feel the belly behind the ribs. If it feels hard like a drum or is visibly swollen, " +
            "this is an emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.90, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "IDENTIFY RETCHING",
            instruction: "Watch the dog for \"unproductive vomiting\"—they are gagging or trying to vomit " +
            "but nothing comes out. This is a primary sign of a twisted stomach.",
            audio: "Watch for gagging without any vomit coming out. This is a sign of a twisted stomach.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "POSITION FOR TRAVEL",
            instruction: "Lay the dog on their right side in the car. DO NOT massage the stomach, " +
            "DO NOT give water, and DO NOT induce vomiting. This will worsen the condition.",
            audio: "Lay the dog on their right side. Do not massage the stomach or give any water.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "EMERGENCY SURGERY",
            instruction: "EMERGENCY. Drive to the nearest emergency vet immediately. Bloat is 100% fatal " +
            "without immediate surgery to untwist the stomach.",
            audio: "Drive to the emergency vet now. This requires immediate surgery to save the dog's life.",
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

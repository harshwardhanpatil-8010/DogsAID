import SwiftUI

struct PregnancyWhelpingEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "IDENTIFY TROUBLE",
            instruction: "Seek help if there is more than 2 hours between puppies or " +
            "30 minutes of strong straining with no puppy.",
            audio: "Call the vet if there is more than two hours between puppies or thirty minutes of hard straining.",
            illustrationIcon: "clock.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "GREEN DISCHARGE",
            instruction: "Dark green discharge BEFORE the first puppy is born indicates an emergency " +
            "(placental separation).",
            audio: "Dark green discharge before any puppies are born is an emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "CHECK FOR OBSTRUCTION",
            instruction: "If a puppy is partially visible but stuck for more than 5 minutes, DO NOT pull forcefully.",
            audio: "Do not pull a stuck puppy. Contact a veterinarian immediately.",
            illustrationIcon: "waveform.path.ecg",
            illustrationColor: Color(red: 0.85, green: 0.35, blue: 0.45)
        ),
        InfoStep(
            title: "EXCESSIVE BLEEDING",
            instruction: "Some blood is normal, but heavy, continuous bleeding is a life-threatening emergency " +
            "for the mother.",
            audio: "Heavy, continuous bleeding is a life-threatening emergency.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "If any abnormal signs occur, transport the mother to the vet immediately. " +
            "Delayed care can be fatal.",
            audio: "Go to an emergency vet immediately if complications occur.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Pregnancy & Whelping",
            paginationAccentColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        )
    }
}

struct PregnancyWhelpingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PregnancyWhelpingEmergencyView()
        }
    }
}

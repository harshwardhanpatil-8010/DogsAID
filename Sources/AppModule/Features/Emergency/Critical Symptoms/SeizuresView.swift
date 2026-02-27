


import SwiftUI

struct SeizuresView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "DO NOT RESTRAIN",
            instruction: "Move furniture away to prevent injury. DO NOT put your hands in or near the dog's mouth.",
            audio: "Do not restrain the dog. Move objects away to prevent injury. Keep your hands away from the mouth.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.35)
        ),
        InfoStep(
            title: "POSITION SAFELY",
            instruction: "Gently roll the dog onto their side if safe. Support the head with a soft towel.",
            audio: "Gently roll the dog onto their side and support their head.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "TIME THE SEIZURE",
            instruction: "Note the exact start and end time. Keep the room dark and quiet to reduce stimulation.",
            audio: "Note the duration of the seizure. Keep the environment dark and quiet.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "MONITOR RECOVERY",
            instruction: "Expect confusion or temporary blindness after the seizure. Keep the dog calm and quiet during recovery.",
            audio: "Post-seizure confusion is normal. Keep the dog calm and quiet.",
            illustrationIcon: "bed.double.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "VET CONSULTATION",
            instruction: "If the seizure lasts more than 3 minutes, or if multiple seizures occur, go to the vet immediately.",
            audio: "If the seizure lasts longer than three minutes, or if they happen in clusters, go to the vet now.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Seizures",
            paginationAccentColor: Color(red: 0.85, green: 0.20, blue: 0.35)
        )
    }
}

struct SeizuresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SeizuresView()
        }
    }
}

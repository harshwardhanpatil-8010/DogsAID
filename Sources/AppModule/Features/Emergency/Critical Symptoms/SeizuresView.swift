import SwiftUI

struct SeizuresView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CLEAR THE SPACE",
            instruction: "Do not touch the dog. Move furniture, chairs, and sharp objects away to create " +
            "a 5-foot safe radius. DO NOT put anything in the dog's mouth.",
            audio: "Do not touch the dog. Move all furniture away. Do not put anything in the mouth.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.35)
        ),
        InfoStep(
            title: "TURN OFF LIGHTS",
            instruction: "Immediately turn off all lights, TV, and music. Seizing dogs are hypersensitive " +
            "to light and sound, which can prolong the seizure.",
            audio: "Turn off all lights and sounds. Make the room dark and quiet.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "TIME THE SEIZURE",
            instruction: "Look at a clock and note the exact start time. If the seizure lasts " +
            "more than 3 minutes, it is a life-threatening EMERGENCY.",
            audio: "Note the start time. If the seizure lasts more than three minutes, go to the vet now.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "PROTECT DURING RECOVERY",
            instruction: "Once the shaking stops, the dog will be blind and confused. Block off " +
            "stairs and keep them on the floor to prevent falls.",
            audio: "Keep the dog on the floor and away from stairs until they are fully awake.",
            illustrationIcon: "bed.double.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. If the dog has multiple seizures in one day, or if one seizure " +
            "lasts over 3 minutes, drive to the vet immediately.",
            audio: "If the seizure is long or repeats, drive to the emergency vet now.",
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

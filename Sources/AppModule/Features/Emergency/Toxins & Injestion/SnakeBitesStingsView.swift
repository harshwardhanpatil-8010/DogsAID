import SwiftUI

struct SnakeBitesStingsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "RECOGNIZE SYMPTOMS",
            instruction: "Look for sudden yelping, rapid swelling, or weakness. Snake bites often cause immediate pain and bleeding.",
            audio: "Watch for sudden swelling, pain, or weakness.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "LIMIT MOVEMENT",
            instruction: "Keep the dog as still as possible to slow the spread of venom. Carry the dog if possible.",
            audio: "Keep your dog completely still. Carry them to the car to slow the venom.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "DO NOT CUT OR SUCK",
            instruction: "DO NOT apply ice, do not cut the wound, and do not try to suck out venom. These actions worsen tissue damage.",
            audio: "Do not use ice or try to cut the wound. Go to the vet immediately.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "REMOVE COLLARS",
            instruction: "Rapid swelling can make collars or harnesses dangerous. Remove any restrictive items near the bite.",
            audio: "Remove collars or tight items immediately.",
            illustrationIcon: "scissors",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "Snake bites require immediate antivenom and professional care. Drive to the vet now.",
            audio: "Go to an emergency vet immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Snake Bites & Stings",
            paginationAccentColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        )
    }
}

struct SnakeBitesStingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SnakeBitesStingsView()
        }
    }
}

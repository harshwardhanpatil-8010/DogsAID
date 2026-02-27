import SwiftUI

struct EyeInjuriesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "STOP THE PAW",
            instruction: "Hold the dog's paws or put socks on them to stop the dog from scratching the eye. " +
            "Rubbing the eye can cause an eyeball to rupture.",
            audio: "Hold the dog's paws. Do not let them scratch or rub the eye.",
            illustrationIcon: "eye.trianglebadge.exclamationmark.fill",
            illustrationColor: Color(red: 0.80, green: 0.20, blue: 0.30)
        ),
        InfoStep(
            title: "FLUSH WITH SALINE",
            instruction: "If the eye is dirty or has a chemical in it, hold the eyelid open and pour " +
            "sterile saline or clean water across the eye for 15 minutes.",
            audio: "Hold the eyelid open and pour clean water across the eye for fifteen minutes.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.25, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "KEEP THE EYE MOIST",
            instruction: "If the eyeball is bulging out of the socket, DO NOT try to push it back in. " +
            "Cover it with a clean, soaking-wet cloth to keep it from drying out.",
            audio: "If the eye is bulging, cover it with a very wet cloth. Do not push on the eye.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.60, green: 0.40, blue: 0.70)
        ),
        InfoStep(
            title: "DO NOT USE DROPS",
            instruction: "DO NOT use human eye drops or redness relievers. These contain chemicals " +
            "that can cause permanent blindness in a damaged dog eye.",
            audio: "Do not use any human eye drops. They can cause permanent blindness.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.55)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet now. A scratched or punctured eye can be lost " +
            "within 2 hours if not treated by a specialist.",
            audio: "Drive to the vet now. Eye injuries can cause permanent blindness in less than two hours.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Eye Injuries",
            paginationAccentColor: Color(red: 0.80, green: 0.20, blue: 0.30)
        )
    }
}

struct EyeInjuriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EyeInjuriesView()
        }
    }
}

import SwiftUI

struct BleedingControlView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "APPLY DIRECT PRESSURE",
            instruction: "Place a clean cloth over the wound. Use the heel of your hand to press straight " +
            "down firmly. DO NOT lift the cloth for 5 minutes to check the wound.",
            audio: "Press a clean cloth firmly onto the wound with the heel of your hand for five minutes. " +
            "Do not lift it.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "ADD MORE LAYERS",
            instruction: "If blood soaks through the cloth, place a second cloth directly on top of " +
            "the first one. DO NOT remove the first cloth, as it will pull off the forming clot.",
            audio: "If blood soaks through, put another cloth on top. Do not remove the first cloth.",
            illustrationIcon: "arrow.up.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "ELEVATE THE LIMB",
            instruction: "If the wound is on a leg, lift the leg so it is higher than the dog's heart " +
            "while continuing to hold pressure.",
            audio: "Lift the bleeding leg higher than the heart while holding pressure.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "APPLY SNUG BANDAGE",
            instruction: "Wrap gauze or a strip of cloth snugly over the padding. You should be able " +
            "to fit one finger under the bandage. If the paws feel cold, it is too tight.",
            audio: "Wrap a bandage over the cloths. Make sure it is snug but not so tight the paws feel cold.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. If the blood is spurting or bright red, an artery is cut. Drive " +
            "to the vet immediately while keeping pressure on the wound.",
            audio: "Drive to the vet now. If blood is spurting, keep holding pressure during the drive.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Bleeding Control",
            paginationAccentColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    }
}

struct BleedingControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BleedingControlView()
        }
    }
}

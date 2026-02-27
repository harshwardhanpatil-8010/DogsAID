import SwiftUI

struct FracturesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "MUZZLE THE DOG",
            instruction: "Wrap a soft cloth or leash around the dog's muzzle. " +
            "Even the gentlest dog will bite hard when a broken bone is touched.",
            audio: "Muzzle the dog with a cloth or leash. They will bite because they are in severe pain.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "LOCATE THE BREAK",
            instruction: "Look for a limb that is dangled, bent at an odd angle, " +
            "or has a bone poking through the skin. " +
            "DO NOT try to straighten the bone.",
            audio: "Look for a bent or dangling leg. Do not try to straighten the bone.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "IMMOBILIZE THE LEG",
            instruction: "Place the dog on a flat board or a thick, folded blanket. DO NOT apply a splint " +
            "unless you are more than 1 hour from a vet, as you may worsen the break.",
            audio: "Put the dog on a flat board or thick blanket. Do not try to splint the leg yourself.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "COVER OPEN WOUNDS",
            instruction: "If a bone is visible, cover the wound loosely with a clean, dry cloth to prevent " +
            "dirt and bacteria from entering the bone.",
            audio: "If the bone is poking through the skin, cover it loosely with a clean cloth.",
            illustrationIcon: "hand.point.up.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "EMERGENCY. Carry the dog to the car. Drive to the vet " +
            "immediately for pain relief and X-rays. " +
            "Do not let the dog walk on the injury.",
            audio: "Carry the dog to the car. Drive to the vet now for pain relief and X-rays.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Fractures & Sprains",
            paginationAccentColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        )
    }
}

struct FracturesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FracturesView()
        }
    }
}

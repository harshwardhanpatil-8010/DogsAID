import SwiftUI

struct FrostbiteHypothermiaView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK SKIN TEMP",
            instruction: "Touch the ears, paws, and tail. If they feel ice-cold, pale, or hard, " +
            "they have frostbite. If the dog is shivering violently or lethargic, they have hypothermia.",
            audio: "Touch the ears and paws. If they are cold and hard, or the dog is shivering, act now.",
            illustrationIcon: "snowflake",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.90)
        ),
        InfoStep(
            title: "MOVE TO WARMTH",
            instruction: "Carry the dog into a warm building. DO NOT let them walk if their paws are frozen. " +
            "Place them on a warm, dry blanket on the floor.",
            audio: "Carry the dog into a warm room. Do not let them walk on frozen paws.",
            illustrationIcon: "house.fill",
            illustrationColor: Color(red: 0.45, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "APPLY WARM COMPRESS",
            instruction: "Soak a cloth in warm (not hot) water. Gently press it against the frozen " +
            "ears or paws. DO NOT rub or massage the skin, as this breaks the frozen tissue.",
            audio: "Press a warm, wet cloth to the ears and paws. Do not rub the skin.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.65, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "WRAP IN BLANKETS",
            instruction: "Wrap the dog's body in dry, warm blankets. Use your own body heat " +
            "by lying next to the dog. DO NOT use heating pads directly on the skin.",
            audio: "Wrap the dog in warm blankets. Use your own body heat to warm them up.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "VET CARE MANDATORY",
            instruction: "EMERGENCY. Go to the vet. Hypothermia causes the blood to become " +
            "acidic and can lead to organ failure even after the dog is warmed.",
            audio: "See a vet immediately. Internal organ damage can happen as the body warms up.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Frostbite & Hypothermia",
            paginationAccentColor: Color(red: 0.35, green: 0.55, blue: 0.90)
        )
    }
}

struct FrostbiteHypothermiaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FrostbiteHypothermiaView()
        }
    }
}

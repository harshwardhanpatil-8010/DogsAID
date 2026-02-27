import SwiftUI

struct FrostbiteHypothermiaView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "RECOGNIZE SYMPTOMS",
            instruction: "Look for shivering, lethargy, or cold, pale skin. Severe cases may lead to collapse.",
            audio: "Watch for shivering, weakness, or cold skin.",
            illustrationIcon: "snowflake",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.90)
        ),
        InfoStep(
            title: "MOVE TO WARMTH",
            instruction: "Immediately move the dog to a warm, dry environment. Protect them from wind and moisture.",
            audio: "Move your dog to a warm, dry area immediately.",
            illustrationIcon: "house.fill",
            illustrationColor: Color(red: 0.45, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "GENTLE WARMING",
            instruction: "Wrap the dog in warm, dry blankets. Use your own body heat if possible.",
            audio: "Move the dog inside. Wrap them in warm, dry blankets.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.65, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "DO NOT RUB",
            instruction: "Do not rub or massage affected areas, as this damages the frozen tissue.",
            audio: "Do not rub or massage the skin. This can cause severe tissue damage.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "Moderate to severe hypothermia requires professional treatment to prevent organ failure.",
            audio: "Seek veterinary care immediately.",
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

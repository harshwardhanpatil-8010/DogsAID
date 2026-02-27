import SwiftUI

struct FrostbiteHypothermiaView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Cold Injury",
            instruction: "Shivering, lethargy, stiff muscles, pale or blue skin, cold ears or paws. Severe cases may collapse.",
            audio: "Watch for shivering, weakness, or cold skin.",
            illustrationIcon: "snowflake",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.90)
        ),
        InfoStep(
            title: "Move to Warm Area",
            instruction: "Bring dog indoors or into a warm, dry shelter immediately. Protect from wind.",
            audio: "Move your dog to a warm, dry area.",
            illustrationIcon: "house.fill",
            illustrationColor: Color(red: 0.45, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "Warm Gradually",
            instruction: "Wrap in warm blankets or towels. Use body heat. Do NOT use hot water or heating pads.",
            audio: "Warm your dog gradually using blankets.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.65, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Do Not Rub Frostbitten Areas",
            instruction: "Rubbing causes tissue damage. Do not break blisters or apply ointments.",
            audio: "Do not rub or massage frostbitten areas.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "Emergency Vet Care",
            instruction: "Moderate to severe hypothermia or frostbite requires immediate veterinary care.",
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

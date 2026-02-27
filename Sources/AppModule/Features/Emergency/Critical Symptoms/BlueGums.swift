import SwiftUI

struct BlueGumsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "OXYGEN EMERGENCY",
            instruction: "Blue or purple gums mean the dog is not getting enough oxygen. This is a critical emergency.",
            audio: "Blue or purple gums mean your dog is suffocating. This is a critical emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "KEEP CALM",
            instruction: "Stay calm and speak softly. Panic increases the dog's oxygen demand and worsens the crisis.",
            audio: "Keep your dog calm and still. Stay calm yourself.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "FRESH AIR",
            instruction: "Immediately move the dog to an area with fresh air. " +
            "Open windows if you are indoors or in a car.",
            audio: "Get fresh air immediately. Open all windows.",
            illustrationIcon: "wind",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "LOOSEN COLLAR",
            instruction: "Gently loosen any tight collars, harnesses, or clothing that might restrict breathing.",
            audio: "Loosen any tight collar or harness gently.",
            illustrationIcon: "figure.walk.circle.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "MONITOR BREATHING",
            instruction: "Watch for gasping or heavy use of the abdominal muscles to breathe.",
            audio: "Monitor breathing effort very closely.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "TRANSPORT IMMEDIATELY",
            instruction: "Do not delay. Keep the dog calm and drive to the nearest vet for oxygen therapy.",
            audio: "Drive to the vet immediately for oxygen. Keep the dog as calm as possible.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Blue Gums (Oxygen Crisis)",
            paginationAccentColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    }
}

struct BlueGumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BlueGumsView()
        }
    }
}

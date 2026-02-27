
import SwiftUI

struct BlueGumsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "EMERGENCY: Check Gums",
            instruction: "Lift lip gently and check gum color. Normal = pink/salmon. " +
                        "Blue/purple = oxygen starvation = LIFE-THREATENING.",
            audio: "Check gum color immediately. Blue means emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Keep Dog Calm & Still",
            instruction: "Stay calm yourself. Speak softly. Keep dog lying down or sitting. " +
                        "Panic increases oxygen demand.",
            audio: "Keep your dog calm and still. Stay calm yourself.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Fresh Air Immediately",
            instruction: "Open ALL windows or doors. Move to fresh air area. " +
                        "Remove from smoke/closed spaces.",
            audio: "Get fresh air immediately. Open all windows.",
            illustrationIcon: "wind",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Loosen Collar/Harness",
            instruction: "Gently loosen tight collar, harness, or clothing. " +
                        "Do NOT remove if airway blocked.",
            audio: "Loosen collar or harness gently.",
            illustrationIcon: "figure.walk.circle.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Monitor Breathing",
            instruction: "Watch chest movement. Listen for gasping/struggling. " +
                        "Count breaths per minute (normal: 10-30).",
            audio: "Monitor breathing rate and effort closely.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "VET IMMEDIATELY",
            instruction: "Blue/purple gums + breathing struggle/panic = EMERGENCY. " +
                        "Transport to vet NOW. Call ahead if possible.",
            audio: "This is a veterinary emergency. Go immediately.",
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

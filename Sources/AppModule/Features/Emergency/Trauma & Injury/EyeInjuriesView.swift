import SwiftUI

struct EyeInjuriesView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Eye Emergency",
            instruction: "Bulging eye, visible scratches, cloudiness, bleeding, squinting, or pawing at eye. Eye injuries can cause permanent blindness quickly.",
            audio: "Bulging, cloudy, or painful eyes are emergencies.",
            illustrationIcon: "eye.trianglebadge.exclamationmark.fill",
            illustrationColor: Color(red: 0.80, green: 0.20, blue: 0.30)
        ),
        InfoStep(
            title: "Prevent Further Damage",
            instruction: "Prevent rubbing or scratching. Use an e-collar if available. Keep dog calm.",
            audio: "Prevent rubbing or scratching the eye.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.60, green: 0.40, blue: 0.70)
        ),
        InfoStep(
            title: "Keep Eye Moist",
            instruction: "If eye is bulging, gently apply sterile saline or clean water to keep it moist. Do NOT push eye back in.",
            audio: "Keep the eye moist with saline if bulging.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.25, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Shield the Eye",
            instruction: "Loosely cover eye with clean, damp cloth if possible. Avoid pressure.",
            audio: "Loosely cover the eye without pressure.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.55)
        ),
        InfoStep(
            title: "Immediate Surgery Needed",
            instruction: "Eye injuries are surgical emergencies. Immediate veterinary care may save vision.",
            audio: "Immediate veterinary care is required.",
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

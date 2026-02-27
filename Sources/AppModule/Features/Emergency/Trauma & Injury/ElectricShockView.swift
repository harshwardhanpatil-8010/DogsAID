import SwiftUI

struct ElectricShockView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "DISCONNECT POWER",
            instruction: "DO NOT touch the dog if they are still touching a wire. Turn off the " +
            "breaker or pull the plug. Use a wooden broom handle to push the wire away.",
            audio: "Do not touch the dog until the power is off. Use a wooden handle to move the wire.",
            illustrationIcon: "bolt.fill",
            illustrationColor: Color(red: 0.95, green: 0.75, blue: 0.20)
        ),
        InfoStep(
            title: "CHECK THE MOUTH",
            instruction: "Inspect the lips, tongue, and roof of the mouth for charred, white, or " +
            "bright red burns. Electricity often causes severe internal mouth damage.",
            audio: "Look for white or charred burns on the tongue and lips.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "FEEL FOR HEARTBEAT",
            instruction: "Slide your fingers behind the left elbow. If the heart has stopped, " +
            "begin CPR immediately. Electric shock often causes the heart to stop.",
            audio: "Feel for a heartbeat behind the left elbow. If none, start CPR immediately.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "WATCH FOR COUGHING",
            instruction: "Watch the dog's breathing. Electric shock causes fluid to fill the " +
            "lungs (edema). If the dog starts coughing or gasping, they are suffocating.",
            audio: "Watch for coughing or gasping. This means the lungs are filling with fluid.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.60, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet immediately. Internal electrical burns " +
            "and lung fluid can be fatal hours after the initial shock.",
            audio: "Drive to the vet now. Internal damage from electricity is fatal if not treated.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Electric Shock",
            paginationAccentColor: Color(red: 0.95, green: 0.75, blue: 0.20)
        )
    }
}

struct ElectricShockView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ElectricShockView()
        }
    }
}

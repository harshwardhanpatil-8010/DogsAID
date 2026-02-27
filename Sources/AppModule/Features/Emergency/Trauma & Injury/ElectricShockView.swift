import SwiftUI

struct ElectricShockView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "DISABLE POWER",
            instruction: "Do NOT touch the dog until the power source is turned off. " +
            "Use a wooden stick to move wires if needed.",
            audio: "Do not touch the dog until the power is off. Use a wooden object to move any live wires.",
            illustrationIcon: "bolt.fill",
            illustrationColor: Color(red: 0.95, green: 0.75, blue: 0.20)
        ),
        InfoStep(
            title: "CHECK BREATHING",
            instruction: "Check for regular breathing and a pulse behind the left elbow. " +
            "Begin CPR if the dog is not breathing.",
            audio: "Check for regular breathing and a pulse. Start CPR if needed.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "CHECK MOUTH",
            instruction: "Inspect the mouth for burns and check for regular breathing. " +
            "Look for charred or swollen tissue.",
            audio: "Check the mouth for burns and ensure the dog is breathing.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "MONITOR LUNGS",
            instruction: "Electric shock can cause fluid to build up in the lungs hours later. " +
            "Watch for coughing or gasping.",
            audio: "Watch for coughing or gasping, which can happen hours later.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.60, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "All electric shocks require an immediate veterinary exam to check for internal damage.",
            audio: "Drive to the vet immediately for a professional exam.",
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

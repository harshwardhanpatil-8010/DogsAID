import SwiftUI

struct ElectricShockView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Ensure Scene Safety",
            instruction: "Do NOT touch your dog until power is off. Unplug source or turn off main power.",
            audio: "Turn off power before touching your dog.",
            illustrationIcon: "bolt.fill",
            illustrationColor: Color(red: 0.95, green: 0.75, blue: 0.20)
        ),
        InfoStep(
            title: "Check Breathing",
            instruction: "Look for breathing difficulty, coughing, blue gums, or collapse. Electric shock can cause lung damage.",
            audio: "Check breathing and gum color.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.35, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Cool Mouth Burns",
            instruction: "Electrical burns often occur in mouth. Gently rinse mouth with cool water if safe.",
            audio: "Rinse mouth gently with cool water.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Monitor Closely",
            instruction: "Breathing problems can worsen hours later. Keep dog calm and limit movement.",
            audio: "Monitor closely for delayed breathing issues.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.60, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Emergency Vet Visit",
            instruction: "All electric shocks require veterinary evaluation, even if dog seems normal.",
            audio: "Go to the vet immediately.",
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

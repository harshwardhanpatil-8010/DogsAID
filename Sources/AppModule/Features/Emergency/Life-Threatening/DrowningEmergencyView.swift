import SwiftUI

struct DrowningEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "Remove from Water",
            instruction: "Remove your dog from the water immediately. " +
                         "Place them on a flat surface and keep their airway clear.",
            audio: "Remove your dog from the water immediately.",
            illustrationIcon: "drop.triangle.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Check Breathing",
            instruction: "Check for breathing by watching chest movement and feeling for airflow. " +
                         "If your dog is not breathing, begin CPR immediately.",
            audio: "Check if your dog is breathing.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "Clear Airway",
            instruction: "Gently pull the tongue forward and check the mouth for debris. " +
                         "Do not shake or hang your dog upside down to remove water.",
            audio: "Clear the airway gently. Do not shake your dog.",
            illustrationIcon: "mouth.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "Provide Rescue Breaths",
            instruction: "If your dog is not breathing but has a heartbeat, " +
                         "close the mouth and give slow rescue breaths into the nose until breathing resumes.",
            audio: "Provide rescue breaths if needed.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "Emergency Vet Care",
            instruction: "Even if your dog seems to recover, go to an emergency veterinarian immediately. " +
                         "Secondary drowning can occur hours later.",
            audio: "Go to an emergency veterinarian immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Drowning",
            paginationAccentColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        )
    }
}

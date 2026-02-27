
import SwiftUI

// MARK: - DogCPREmergencyView

struct DogCPREmergencyView: View {

    private let steps: [CPRStep] = [
        CPRStep(
            title: "Call for Help",
            instruction: "Call the nearest emergency veterinary clinic immediately. " +
                         "Put your phone on speaker so both hands stay free.",
            audio: "Call the nearest emergency veterinary clinic immediately. " + "Put your phone on speaker.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40),
            kind: .info
        ),
        CPRStep(
            title: "Check Consciousness",
            instruction: "Tap your dog and call their name loudly. " +
                         "If they respond or move, do not perform CPR —" + "keep them calm and get to a vet.",
            audio: "Check if your dog is conscious. If your dog responds, do not perform CPR.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95),
            kind: .info
        ),
        CPRStep(
            title: "Check Breathing",
            instruction: "Watch for chest rise and fall. Place your hand near their nose to feel for airflow. " +
                         "Listen closely for breath sounds. If there is no breathing," + "begin CPR on the next step.",
            audio: "Check breathing. Look for chest movement. Listen for breath. " +
                   "If no breathing, proceed to CPR.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95),
            kind: .info
        ),
        CPRStep(
            title: "CPR 30 Compressions + 2 Breaths",
            instruction: "Tap \"Start CPR\" below. The app will guide you through each cycle: " +
                         "30 chest compressions at 110 BPM, followed by 2" + "rescue breaths into your dog's nose. " +
                         "Keep repeating until help arrives.",
            audio: "Begin CPR. Do 30 chest compressions, then give 2 rescue breaths into the nose. " +
                   "Repeat until help arrives. " + "Tap start to begin CPR and follow the instructions on screen.",
            sizeGuidance: SizeGuidance(
                smallDog: "Small dogs: Use one hand or two fingers.",
                largeDog: "Large dogs: Use both hands, one on top of the other."
            ),
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25),
            kind: .cpr
        ),
        CPRStep(
            title: "Go to Emergency Vet",
            instruction: "Continue CPR without stopping while someone drives" + "you to the nearest emergency veterinarian. " +
                         "Do not stop CPR until a professional takes over.",
            audio: "Go to the emergency veterinarian immediately." + "Continue CPR during transport.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15),
            kind: .info
        )
    ]

    var body: some View {
        EmergencyFlowView(steps: steps, navigationTitle: "Dog CPR") { step, isVisible in
           
            if step.isInteractive {
                CPRCycleView(isPageVisible: isVisible)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        DogCPREmergencyView()
    }
}

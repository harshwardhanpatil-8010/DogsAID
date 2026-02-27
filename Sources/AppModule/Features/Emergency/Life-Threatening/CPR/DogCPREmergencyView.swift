import SwiftUI

// MARK: - DogCPREmergencyView

struct DogCPREmergencyView: View {

    private let steps: [CPRStep] = [
        CPRStep(
            title: "CALL FOR HELP",
            instruction: "Call the nearest emergency vet immediately. Put your phone on speaker so both hands are free.",
            audio: "Call the nearest emergency veterinarian immediately. Put your phone on speaker.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40),
            kind: .info
        ),
        CPRStep(
            title: "CHECK FOR PULSE",
            instruction: "Check for breathing and feel for a heartbeat behind the left elbow. " +
            "DO NOT perform CPR if the dog is breathing or has a pulse.",
            audio: "Check for breathing and feel for a heartbeat behind the left elbow. " +
            "Do not perform CPR if the dog is breathing or has a pulse.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25),
            kind: .info
        ),
        CPRStep(
            title: "POSITION THE DOG",
            instruction: "Lay the dog on their right side on a flat, firm surface. Ensure the head and neck are straight.",
            audio: "Lay the dog on their right side on a flat, firm surface. Make sure the head and neck are aligned.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95),
            kind: .info
        ),
        CPRStep(
            title: "START CPR CYCLE",
            instruction: "Perform 30 chest compressions followed by 2 breaths. " +
            "Press down 1/3 of chest depth, 100-120 times per minute.",
            audio: "Start the CPR cycle now. Give thirty compressions followed by two breaths. " +
            "Push down firmly and fast.",
            sizeGuidance: SizeGuidance(
                smallDog: "Small dogs: Use one hand or two fingers.",
                largeDog: "Large dogs: Use both hands, one on top of the other."
            ),
            illustrationIcon: "timer",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25),
            kind: .cpr
        ),
        CPRStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "Continue CPR without stopping while someone drives you to the vet. " +
            "Do not stop until a professional takes over.",
            audio: "Continue CPR while transporting the dog to the vet. Do not stop until help arrives.",
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

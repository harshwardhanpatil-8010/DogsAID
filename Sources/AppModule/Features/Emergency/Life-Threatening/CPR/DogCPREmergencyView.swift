import SwiftUI

// MARK: - DogCPREmergencyView

struct DogCPREmergencyView: View {

    private let steps: [CPRStep] = [
        CPRStep(
            title: "CALL FOR HELP",
            instruction: "Call the nearest emergency vet immediately. Put your phone on speaker and " +
            "place it on the ground so both of your hands remain free for the dog.",
            audio: "Call the emergency vet now. Put your phone on speaker so your hands are free.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.40),
            kind: .info
        ),
        CPRStep(
            title: "CHECK HEARTBEAT",
            instruction: "Slide your fingers into the \"armpit\" area directly behind the left elbow " +
            "to feel for a heartbeat. Watch the chest for 5 seconds for any rise and fall. " +
            "DO NOT start CPR if there is a pulse.",
            audio: "Feel for a heartbeat behind the left elbow. Watch the chest for movement. " +
            "Do not start CPR if you feel a pulse.",
            illustrationIcon: "heart.fill",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25),
            kind: .info
        ),
        CPRStep(
            title: "POSITION THE DOG",
            instruction: "Lay the dog on their right side on a flat, firm floor. Pull the head and neck " +
            "forward into a straight line to open the airway.",
            audio: "Lay the dog on their right side on a firm floor. Straighten the head and neck.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95),
            kind: .info
        ),
        CPRStep(
            title: "START COMPRESSIONS",
            instruction: "For large dogs, place the heel of one hand over the widest part of the chest " +
            "(behind the left elbow) and the other hand on top. For small dogs, wrap one hand " +
            "around the chest. Press down 2 inches, 100 times per minute.",
            audio: "Place the heel of your hand on the chest behind the left elbow. " +
            "Push down two inches, twice every second.",
            sizeGuidance: SizeGuidance(
                smallDog: "Small dogs: Wrap one hand around the chest so your thumb is on " +
                "one side and fingers on the other.",
                largeDog: "Large dogs: Use both hands, heel of one hand on the widest part of " +
                "the chest, other hand on top."
            ),
            illustrationIcon: "timer",
            illustrationColor: Color(red: 0.95, green: 0.25, blue: 0.25),
            kind: .cpr
        ),
        CPRStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "EMERGENCY. Continue compressions and breaths without stopping while someone else " +
            "drives you to the vet. Do not stop until a professional takes over the dog.",
            audio: "Continue CPR while someone drives you to the vet. Do not stop until help arrives.",
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

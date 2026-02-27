import SwiftUI

struct PregnancyWhelpingEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Labor",
            instruction: "Normal labor signs include nesting, restlessness, panting, and a drop in body temperature. " +
                         "Early labor may last several hours.",
            audio: "Recognize the normal signs of labor in your dog.",
            illustrationIcon: "clock.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Monitor Contractions",
            instruction: "Active contractions should produce a puppy within 30 to 60 minutes. " +
                         "Strong straining for more than one hour without a puppy is an emergency.",
            audio: "Monitor contractions closely. Prolonged straining is an emergency.",
            illustrationIcon: "waveform.path.ecg",
            illustrationColor: Color(red: 0.85, green: 0.35, blue: 0.45)
        ),
        InfoStep(
            title: "Check for Obstruction",
            instruction: "If you see part of a puppy stuck for more than a few minutes, do not pull forcefully. " +
                         "Gently support the area and contact a veterinarian immediately.",
            audio: "Do not pull a stuck puppy. Contact a veterinarian immediately.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "Watch for Distress",
            instruction: "Signs of emergency include excessive bleeding, collapse, " +
                         "green discharge before any puppies are born, or extreme pain.",
            audio: "Watch for signs of distress or abnormal bleeding.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "Emergency Vet Care",
            instruction: "If any abnormal signs occur, transport your dog to an emergency veterinarian immediately. " +
                         "Delayed care can be life-threatening.",
            audio: "Go to an emergency veterinarian immediately if complications occur.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Pregnancy & Whelping",
            paginationAccentColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        )
    }
}

struct PregnancyWhelpingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PregnancyWhelpingEmergencyView()
        }
    }
}

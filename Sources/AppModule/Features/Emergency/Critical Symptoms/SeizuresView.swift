


import SwiftUI

struct SeizuresView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Protect During Seizure",
            instruction: "Clear area of objects. Do NOT restrain or put hands in mouth. " +
                        "Time seizure duration (normal: <2 min). Turn lights low.",
            audio: "Clear area. Do not restrain. Time the seizure duration.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.35)
        ),
        InfoStep(
            title: "Side Position",
            instruction: "Gently roll dog onto side if safe. Support head on towel. " +
                        "Keep airway clear. No water/food during seizure.",
            audio: "Roll onto side gently. Support head. No water during seizure.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Monitor & Time",
            instruction: "Watch breathing, drooling, paddling, urination. " +
                        "Note duration, clusters, post-seizure behavior.",
            audio: "Monitor breathing and time exactly. Note all symptoms.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Post-Seizure Recovery",
            instruction: "Postictal: confusion, blindness, pacing (up to 24h). " +
                        "Dark quiet room. No stimulation. Offer water when alert.",
            audio: "Post-seizure confusion normal. Keep dark and quiet.",
            illustrationIcon: "bed.double.fill",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "VET EMERGENCY",
            instruction: "**IMMEDIATE VET** if: first seizure, >5 min, clusters, status epilepticus. " +
                        "Even single short seizure needs neuro exam.",
            audio: "Vet immediately for first seizure, over five minutes, or clusters.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Seizures",
            paginationAccentColor: Color(red: 0.85, green: 0.20, blue: 0.35)
        )
    }
}

struct SeizuresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SeizuresView()
        }
    }
}


import SwiftUI

struct PlantPoisoningView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "URGENT: Identify Plant",
            instruction: "Take clear photo of plant or bring sample to vet. " +
                        "Common toxins: lilies, sago palm, azaleas, oleander, tulips.",
            audio: "Identify the plant immediately and take a photo.",
            illustrationIcon: "leaf.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Remove Plant Material",
            instruction: "Gently wipe mouth with damp cloth. Remove visible plant pieces. " +
                        "Prevent further chewing or licking.",
            audio: "Remove plant material from mouth carefully.",
            illustrationIcon: "hand.wave.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "DO NOT Induce Vomiting",
            instruction: "Never induce vomiting unless vet specifically instructs. " +
                        "Some plants cause worse damage coming back up.",
            audio: "Do NOT induce vomiting unless veterinarian instructs.",
            illustrationIcon: "xmark.circle.fill",
            illustrationColor: Color(red: 0.90, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "Call Poison Control NOW",
            instruction: "Call vet or Pet Poison Helpline (888-426-4435). Have plant name/photo ready. " +
                        "Follow their exact instructions.",
            audio: "Call poison control or veterinarian immediately.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "Monitor Critical Signs",
            instruction: "Watch for: excessive drooling, vomiting, diarrhea, breathing difficulty, seizures, collapse. ",
            audio: "Monitor for vomiting, seizures, breathing problems.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Emergency Vet Transport",
            instruction: "Go to vet immediately if: lilies ingested, severe vomiting/diarrhea, " +
                        "breathing/swallowing issues, seizures, collapse, mouth irritation.",
            audio: "Transport to emergency vet if severe symptoms appear.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Plant Poisoning",
            paginationAccentColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    }
}

struct PlantPoisoningView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlantPoisoningView()
        }
    }
}

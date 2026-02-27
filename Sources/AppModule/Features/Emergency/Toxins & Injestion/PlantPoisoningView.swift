
import SwiftUI

struct PlantPoisoningView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "TAKE A PHOTO",
            instruction: "Identify the plant or take a clear photo of the leaves and flowers for the vet.",
            audio: "Identify the plant or take a photo of it for the veterinarian.",
            illustrationIcon: "leaf.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "REMOVE MATERIAL",
            instruction: "Gently wipe the mouth with a damp cloth to remove any remaining plant pieces.",
            audio: "Gently wipe the mouth to remove any plant pieces.",
            illustrationIcon: "hand.wave.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT induce vomiting unless specifically instructed by a veterinarian.",
            audio: "Do not make the dog vomit unless a vet tells you to.",
            illustrationIcon: "xmark.circle.fill",
            illustrationColor: Color(red: 0.90, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "CALL POISON CONTROL",
            instruction: "Contact your vet or a pet poison hotline immediately. Have the plant photo or name ready.",
            audio: "Call your veterinarian or animal poison control immediately.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "OBSERVE SYMPTOMS",
            instruction: "Watch for drooling, vomiting, tremors, or breathing difficulty.",
            audio: "Watch for drooling, vomiting, or tremors.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "EMERGENCY TRANSPORT",
            instruction: "Drive to the vet immediately. Bring a sample of the plant or the photo you took.",
            audio: "Go to the vet immediately and bring the plant sample or photo.",
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

import SwiftUI

struct PlantPoisoningView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "REMOVE PLANT PIECES",
            instruction: "Use a damp cloth to wipe the inside of the dog's mouth and tongue. " +
            "Remove any visible leaves, petals, or seeds.",
            audio: "Wipe the inside of the mouth and tongue with a damp cloth to remove plant pieces.",
            illustrationIcon: "leaf.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "TAKE A PHOTO",
            instruction: "Take a clear photo of the plant's leaves and flowers. If possible, put a " +
            "sample of the plant in a plastic bag to bring to the vet.",
            audio: "Take a photo of the plant or bring a sample in a bag for the vet.",
            illustrationIcon: "hand.wave.fill",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "DO NOT INDUCE VOMITING",
            instruction: "DO NOT induce vomiting. Some plants are caustic and will burn the throat " +
            "again on the way back up.",
            audio: "Do not make the dog vomit. It can burn the throat.",
            illustrationIcon: "xmark.circle.fill",
            illustrationColor: Color(red: 0.90, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "WATCH FOR TREMORS",
            instruction: "Watch the dog's legs and head for twitching or tremors. This indicates " +
            "the plant toxin is affecting the nervous system.",
            audio: "Watch for any twitching or shaking in the legs or head.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet immediately. Many common plants like Lilies, " +
            "Azaleas, and Sago Palms cause rapid, irreversible organ failure.",
            audio: "Drive to the vet now. Many common plants cause instant organ failure.",
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

import SwiftUI

struct VomitingView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "CHECK THE BELLY",
            instruction: "Feel the dog's abdomen. If it is hard or painful when touched, or if the " +
            "dog is retching without anything coming up, follow Bloat instructions.",
            audio: "Feel the belly. If it is hard or the dog is gagging without vomiting, this is a bloat emergency.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.20, green: 0.50, blue: 0.80)
        ),
        InfoStep(
            title: "INSPECT THE VOMIT",
            instruction: "Look at the vomit. If you see bright red blood, dark \"coffee grounds\" " +
            "(digested blood), or pieces of plastic/toys, go to the vet now.",
            audio: "Look for blood or pieces of toys in the vomit. If you see them, go to the vet now.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "REMOVE ALL FOOD",
            instruction: "Pick up all food bowls immediately. Do not feed the dog for 12 hours. " +
            "Offer only 1 tablespoon of water every hour to prevent the stomach from cramping.",
            audio: "Remove all food. Give only one tablespoon of water every hour.",
            illustrationIcon: "fork.knife",
            illustrationColor: Color(red: 0.55, green: 0.38, blue: 0.22)
        ),
        InfoStep(
            title: "CHECK GUM COLOR",
            instruction: "Lift the lip and look at the gums. If they feel dry or tacky to the touch, " +
            "or look pale, the dog is dangerously dehydrated or in shock.",
            audio: "Feel the gums. If they are dry or tacky, the dog is dangerously dehydrated.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.18, green: 0.52, blue: 0.92)
        ),
        InfoStep(
            title: "CALL THE VET",
            instruction: "If the dog is a puppy, a senior, or if vomiting happens more than 3 times " +
            "in one hour, drive to the vet immediately.",
            audio: "If your dog is a puppy or senior, or vomits three times in one hour, go to the vet now.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.55, green: 0.18, blue: 0.78)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Vomiting",
            paginationAccentColor: Color(red: 0.20, green: 0.50, blue: 0.80)
        )
    }
}

struct VomitingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VomitingView()
        }
    }
}

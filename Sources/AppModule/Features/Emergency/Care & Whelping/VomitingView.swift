

import SwiftUI

struct VomitingView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "WITHHOLD FOOD",
            instruction: "Remove food for 12–24 hours to let the stomach rest. Provide small amounts of water or ice cubes to prevent dehydration.",
            audio: "Do not feed the dog for twelve hours, but offer small sips of water.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.20, green: 0.50, blue: 0.80)
        ),
        InfoStep(
            title: "BLOAT CHECK",
            instruction: "If vomiting is accompanied by a hard, swollen belly or unproductive retching, go to the vet immediately.",
            audio: "If the dog has a swollen belly or can't vomit, see a vet now.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "IDENTIFY TOXINS",
            instruction: "Check if the dog could have ingested toxic foods, plants, or household chemicals. Note the color and consistency of the vomit.",
            audio: "Check for ingested toxins and note the appearance of the vomit.",
            illustrationIcon: "fork.knife",
            illustrationColor: Color(red: 0.55, green: 0.38, blue: 0.22)
        ),
        InfoStep(
            title: "CHECK FOR SHOCK",
            instruction: "Look for pale gums, extreme lethargy, or a rapid heartbeat. These are signs of a severe internal issue.",
            audio: "Watch for pale gums or extreme weakness.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.18, green: 0.52, blue: 0.92)
        ),
        InfoStep(
            title: "REINTRODUCE FOOD",
            instruction: "After 12 hours without vomiting, offer a bland diet of boiled chicken and rice in small portions.",
            audio: "Offer small portions of boiled chicken and rice after twelve hours.",
            illustrationIcon: "takeoutbag.and.cup.and.straw.fill",
            illustrationColor: Color(red: 0.22, green: 0.62, blue: 0.22)
        ),
        InfoStep(
            title: "CALL THE VET",
            instruction: "If vomiting persists for more than 24 hours, or if the dog is very young or old, seek professional advice.",
            audio: "Call the vet if vomiting continues or if your dog is very young or old.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.55, green: 0.18, blue: 0.78)
        ),
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

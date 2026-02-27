

import SwiftUI

struct VomitingView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Stay Calm & Assess",
            instruction: "Observe your dog closely. Note how many times they have vomited, what the vomit looks like, and whether your dog seems alert or lethargic. This information is critical when you call your vet.",
            audio: "Stay calm and observe your dog closely. Note how many times they have vomited, what the vomit looks like, and whether your dog seems alert or lethargic.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.20, green: 0.50, blue: 0.80)
        ),
        InfoStep(
            title: "Is It an Emergency?",
            instruction: "Go to an emergency vet immediately if you see blood in the vomit, vomiting more than 3 times in an hour, a swollen or hard belly, extreme lethargy or collapse, suspected toxin or foreign object ingestion, or if the dog is a puppy under 6 months.",
            audio: "Go to an emergency vet immediately if you see blood in the vomit, vomiting more than three times in an hour, a swollen or hard belly, extreme lethargy or collapse, or suspected toxin or foreign object ingestion.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        ),
        InfoStep(
            title: "Withhold Food",
            instruction: "If vomiting is mild with no danger signs, withhold all food for 12 hours to let the stomach rest. Do not withhold water. Offer small sips frequently rather than letting your dog drink a large amount at once.",
            audio: "Withhold all food for twelve hours to let the stomach rest. Do not withhold water. Offer small sips frequently rather than letting your dog drink a large amount at once.",
            illustrationIcon: "fork.knife",
            illustrationColor: Color(red: 0.55, green: 0.38, blue: 0.22)
        ),
        InfoStep(
            title: "Check for Dehydration",
            instruction: "Pinch the skin on the back of the neck — it should snap back immediately. Check gum colour — should be pink and moist. Pale, white, or tacky gums are an emergency. Sunken eyes and extreme lethargy are also warning signs. If any are present, go to the vet immediately.",
            audio: "Pinch the skin on the back of the neck — it should snap back immediately. Check gum colour — it should be pink and moist. Pale, white, or dry gums are an emergency. If any warning signs are present, go to the vet immediately.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.18, green: 0.52, blue: 0.92)
        ),
        InfoStep(
            title: "Reintroduce Food Slowly",
            instruction: "After 12 hours without vomiting, offer plain boiled chicken (no skin, no seasoning) and plain white rice in a 1:3 ratio. Give only a few tablespoons, wait 2 hours, then offer a little more. Continue small meals every 4–6 hours for 24 hours before returning to normal food.",
            audio: "After twelve hours without vomiting, offer plain boiled chicken and plain white rice. Give only a few tablespoons, wait two hours, then offer a little more. Continue small meals every four to six hours for twenty-four hours before returning to normal food.",
            illustrationIcon: "takeoutbag.and.cup.and.straw.fill",
            illustrationColor: Color(red: 0.22, green: 0.62, blue: 0.22)
        ),
        InfoStep(
            title: "When to Call the Vet",
            instruction: "Call your vet if vomiting recurs after bland food, your dog has not eaten normally within 48 hours, your dog is a senior or has a known health condition, or you are unsure what caused the vomiting. Always better to call — your vet can advise whether a visit is needed.",
            audio: "Call your vet if vomiting recurs after bland food, your dog has not eaten normally within forty-eight hours, your dog is a senior or has a health condition, or you are unsure of the cause.",
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

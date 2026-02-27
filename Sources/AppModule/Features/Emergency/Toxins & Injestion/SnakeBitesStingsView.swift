import SwiftUI

struct SnakeBitesStingsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize the Bite or Sting",
            instruction: "Sudden yelping, swelling at bite site, pain, limping, drooling, vomiting, weakness, or collapse. Snake bites often cause rapid swelling and bleeding.",
            audio: "Watch for sudden swelling, pain, weakness, or collapse.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        ),
        InfoStep(
            title: "DO NOT Do These",
            instruction: "Do NOT cut the wound, suck venom, apply tourniquets, ice, or electric shock. These worsen tissue damage.",
            audio: "Do not cut, suck venom, or apply ice or tourniquets.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "Keep Dog Still",
            instruction: "Limit movement to slow venom spread. Carry your dog if possible. Keep the bite area below heart level.",
            audio: "Keep your dog still and calm.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "Remove Collars or Tight Items",
            instruction: "Swelling can become severe. Remove collars, harnesses, or bandages near the bite area.",
            audio: "Remove collars or tight items immediately.",
            illustrationIcon: "scissors",
            illustrationColor: Color(red: 0.45, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "Emergency Vet Care",
            instruction: "Snake bites and severe stings require immediate veterinary treatment. Antivenom or emergency medications may be lifesaving.",
            audio: "Go to an emergency vet immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Snake Bites & Stings",
            paginationAccentColor: Color(red: 0.85, green: 0.20, blue: 0.20)
        )
    }
}

struct SnakeBitesStingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SnakeBitesStingsView()
        }
    }
}

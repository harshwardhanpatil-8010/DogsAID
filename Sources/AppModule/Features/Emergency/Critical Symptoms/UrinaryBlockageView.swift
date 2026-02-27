import SwiftUI

struct UrinaryBlockageView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "IDENTIFY STRAINING",
            instruction: "Watch the dog while they try to pee. If they are hunched up and straining " +
            "for more than 1 minute with only drops or no urine coming out, this is an EMERGENCY.",
            audio: "Watch for straining with no urine. This is a life-threatening emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.80, green: 0.25, blue: 0.30)
        ),
        InfoStep(
            title: "LOCATE THE BLADDER",
            instruction: "Feel the lower abdomen between the back legs. A blocked bladder will feel " +
            "like a hard, painful lemon or orange.",
            audio: "Feel the lower belly between the back legs for a hard, lemon-sized lump.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "DO NOT PRESS",
            instruction: "DO NOT squeeze or massage the bladder. High pressure can cause the bladder " +
            "to burst inside the dog, leading to instant shock and death.",
            audio: "Do not press on the bladder. It can burst and kill the dog instantly.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "LIMIT WATER",
            instruction: "Remove the water bowl. If the dog drinks more, the bladder will fill further, " +
            "increasing the risk of it bursting before you reach the vet.",
            audio: "Remove the water bowl immediately. Do not let the dog drink.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.75, green: 0.35, blue: 0.35)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet right now. A total blockage causes toxins " +
            "to build up in the blood, causing heart failure within 24 hours.",
            audio: "Drive to the emergency vet now. This will cause heart failure if not treated immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Urinary Blockage",
            paginationAccentColor: Color(red: 0.80, green: 0.25, blue: 0.30)
        )
    }
}

struct UrinaryBlockageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UrinaryBlockageView()
        }
    }
}



import SwiftUI

struct AnaphylaxisView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "RECOGNIZE ANAPHYLAXIS",
            instruction: "Face swelling, hives, vomiting, collapse, breathing distress (bee sting/vaccine). " +
                        "**5-30 min onset.**",
            audio: "Swelling, hives, collapse after sting equals anaphylaxis.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.75, green: 0.20, blue: 0.75)
        ),
        InfoStep(
            title: "Remove Stinger",
            instruction: "Scrape with credit card (NOT tweezers). Wash area. " +
                        "Benadryl 1mg/lb if prescribed.",
            audio: "Remove stinger with edge. Give Benadryl if prescribed.",
            illustrationIcon: "creditcard",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "Airway Management",
            instruction: "Elevate head. Monitor breathing. **Epipen if prescribed.**",
            audio: "Elevate head. Monitor breathing closely.",
            illustrationIcon: "lungs.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "VET EMERGENCY",
            instruction: "**SHOCK imminent.** IV epinephrine, steroids, fluids. " +
                        "Airway swelling → suffocation.",
            audio: "Veterinary emergency immediately. Airway swelling likely.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.75, green: 0.15, blue: 0.75)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Anaphylaxis",
            paginationAccentColor: Color(red: 0.75, green: 0.20, blue: 0.75)
        )
    }
}

struct AnaphylaxisView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnaphylaxisView()
        }
    }
}

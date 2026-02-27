

import SwiftUI

struct BloatView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "RECOGNIZE BLOAT (GDV)",
            instruction: "Distended abdomen, unproductive retching, drooling, restlessness, collapse. " +
                        "**Large/deep-chested breeds.** 100% fatal without surgery.",
            audio: "Distended belly, can't vomit, collapse equals bloat emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.90, green: 0.25, blue: 0.25)
        ),
        InfoStep(
            title: "DO NOT DELAY",
            instruction: "**15-30 min survival window.** Every minute counts. " +
                        "Transport immediately. Call vet en route.",
            audio: "Immediate veterinary emergency. Survival minutes only.",
            illustrationIcon: "stopwatch.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.15)
        ),
        InfoStep(
            title: "Position on RIGHT Side",
            instruction: "Right side down helps stomach position. Blanket stretcher. " +
                        "Calm handling. No food/water.",
            audio: "Right side down during transport. No food or water.",
            illustrationIcon: "pause.circle.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.90)
        ),
        InfoStep(
            title: "VET EMERGENCY ONLY",
            instruction: "**SURGERY REQUIRED** (gastropexy). IV fluids, decompression, x-rays. " +
                        "**DO NOT** massage stomach or induce vomiting.",
            audio: "Surgery required. Do not massage stomach.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.90, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Bloat (GDV)",
            paginationAccentColor: Color(red: 0.90, green: 0.25, blue: 0.25)
        )
    }
}

struct BloatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BloatView()
        }
    }
}

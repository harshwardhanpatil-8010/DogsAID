import SwiftUI

struct PregnancyWhelpingEmergencyView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "TIME THE STRAINING",
            instruction: "Look at the clock. If the mother has been straining or pushing hard for " +
            "more than 30 minutes with no puppy appearing, this is an EMERGENCY.",
            audio: "If the mother pushes for thirty minutes with no puppy, go to the vet now.",
            illustrationIcon: "clock.fill",
            illustrationColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "CHECK DISCHARGE COLOR",
            instruction: "Look at the fluid coming from the mother. If you see dark green discharge " +
            "and NO puppy has been born yet, the placentas are failing.",
            audio: "Dark green discharge before the first puppy is born is a life-threatening emergency.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.95, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "IDENTIFY STUCK PUPPY",
            instruction: "If a puppy is visible but stuck in the birth canal, DO NOT pull on the " +
            "puppy's legs or tail. This can cause fatal internal tearing.",
            audio: "Do not pull a stuck puppy. Contact a veterinarian immediately.",
            illustrationIcon: "waveform.path.ecg",
            illustrationColor: Color(red: 0.85, green: 0.35, blue: 0.45)
        ),
        InfoStep(
            title: "MONITOR THE MOTHER",
            instruction: "Look at the mother's gums. If they are white or she is bleeding heavily " +
            "(more than 2 tablespoons), she is hemorrhaging internally.",
            audio: "If the mother has white gums or heavy bleeding, she is hemorrhaging. Go to the vet now.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.40, green: 0.55, blue: 0.95)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Transport the mother and any born puppies to the vet immediately. " +
            "A stuck puppy or hemorrhage will kill the mother and the litter.",
            audio: "Go to an emergency vet immediately if complications occur.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Pregnancy & Whelping",
            paginationAccentColor: Color(red: 0.55, green: 0.55, blue: 0.85)
        )
    }
}

struct PregnancyWhelpingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PregnancyWhelpingEmergencyView()
        }
    }
}

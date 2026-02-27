import SwiftUI

struct HitByCarView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "APPROACH FROM FRONT",
            instruction: "Approach the dog's head slowly so they can see you. If the dog is conscious, " +
            "muzzle them with a leash; pain causes immediate biting.",
            audio: "Approach the dog's head slowly. Muzzle them before touching the injury.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        ),
        InfoStep(
            title: "CHECK GUM COLOR",
            instruction: "Lift the lip and press your finger against the gum. If the gum is white " +
            "or the color takes more than 2 seconds to return, the dog is in shock.",
            audio: "Press the gums. If they are white or stay pale, the dog is in life-threatening shock.",
            illustrationIcon: "figure.wave.circle",
            illustrationColor: Color(red: 0.95, green: 0.65, blue: 0.20)
        ),
        InfoStep(
            title: "USE A STRETCHER",
            instruction: "Slide a flat board or a large, stiff blanket under the dog. " +
            "Keep the spine as straight as possible while lifting them into the car.",
            audio: "Slide a flat board or stiff blanket under the dog. Keep the spine straight while lifting.",
            illustrationIcon: "bandage.fill",
            illustrationColor: Color(red: 0.82, green: 0.22, blue: 0.28)
        ),
        InfoStep(
            title: "CONTROL BLEEDING",
            instruction: "Use the heel of your hand to press a clean cloth onto any spurting wounds. " +
            "Continue holding pressure during the entire drive to the vet.",
            audio: "Press a clean cloth onto any bleeding wounds and hold it there during the drive.",
            illustrationIcon: "figure.walk",
            illustrationColor: Color(red: 0.70, green: 0.55, blue: 0.75)
        ),
        InfoStep(
            title: "EMERGENCY VET CARE",
            instruction: "EMERGENCY. Drive to the vet now. Internal bleeding in the lungs or " +
            "abdomen is invisible but will kill the dog within minutes or hours.",
            audio: "Drive to the vet now. Invisible internal bleeding is the biggest risk.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.65, green: 0.15, blue: 0.85)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Dog Hit By Car",
            paginationAccentColor: Color(red: 0.65, green: 0.25, blue: 0.85)
        )
    }
}

struct HitByCarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HitByCarView()
        }
    }
}

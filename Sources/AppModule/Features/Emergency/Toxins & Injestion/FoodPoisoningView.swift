

import SwiftUI

struct FoodPoisoningView: View {
    private let steps: [InfoStep] = [
        InfoStep(
            title: "Identify the Food",
            instruction: "Identify what your dog ate and how much. " +
                         "Common toxic foods include chocolate, grapes, raisins, and xylitol (found in sugar-free gum and sweets). " +
                         "Check packaging immediately if available.",
            audio: "Identify what your dog ate and how much.",
            illustrationIcon: "exclamationmark.triangle.fill",
            illustrationColor: Color(red: 0.85, green: 0.55, blue: 0.15)
        ),
        InfoStep(
            title: "Do NOT Induce Vomiting",
            instruction: "Do not induce vomiting unless instructed by a veterinarian. " +
                         "Some substances like xylitol act very quickly and improper action can make things worse.",
            audio: "Do not induce vomiting unless told by a vet.",
            illustrationIcon: "hand.raised.fill",
            illustrationColor: Color(red: 0.80, green: 0.30, blue: 0.20)
        ),
        InfoStep(
            title: "Watch for Symptoms",
            instruction: "Monitor for symptoms such as vomiting, diarrhea, tremors, seizures, weakness, or collapse. " +
                         "Xylitol can cause rapid low blood sugar within 30 minutes.",
            audio: "Watch closely for symptoms like vomiting or weakness.",
            illustrationIcon: "eye.fill",
            illustrationColor: Color(red: 0.55, green: 0.75, blue: 0.95)
        ),
        InfoStep(
            title: "Call Emergency Vet Immediately",
            instruction: "Call your veterinarian or an emergency animal hospital immediately. " +
                         "Provide details about the food, amount consumed, and your dog's weight.",
            audio: "Call your emergency veterinarian immediately.",
            illustrationIcon: "phone.fill",
            illustrationColor: Color(red: 0.20, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Go to Emergency Care",
            instruction: "Take your dog to the nearest emergency veterinarian without delay. " +
                         "Bring the food packaging if possible. Early treatment significantly improves survival chances.",
            audio: "Take your dog to emergency care immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Food Poisoning",
            paginationAccentColor: Color(red: 0.85, green: 0.55, blue: 0.15)
        )
    }
}

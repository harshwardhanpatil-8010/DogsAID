
import SwiftUI

struct TemperatureBurnsView: View {

    private let steps: [InfoStep] = [
        InfoStep(
            title: "Recognize Temperature Danger",
            instruction: "Heatstroke signs include excessive panting, drooling, vomiting, weakness, or collapse. " +
                         "Hypothermia signs include shivering, lethargy, and cold ears or paws.",
            audio: "Recognize signs of dangerous body temperature.",
            illustrationIcon: "thermometer.high",
            illustrationColor: Color(red: 0.90, green: 0.35, blue: 0.25)
        ),
        InfoStep(
            title: "Move to Safety",
            instruction: "Move your dog away from the heat or cold source immediately. " +
                         "Place them in a shaded, cool area or a warm, dry environment as needed.",
            audio: "Move your dog to a safe environment immediately.",
            illustrationIcon: "house.fill",
            illustrationColor: Color(red: 0.40, green: 0.65, blue: 0.55)
        ),
        InfoStep(
            title: "Cool or Warm Gradually",
            instruction: "For overheating, use cool (not ice-cold) water on paws and belly. " +
                         "For hypothermia, wrap in warm towels. Avoid rapid temperature changes.",
            audio: "Adjust your dog’s temperature gradually.",
            illustrationIcon: "drop.fill",
            illustrationColor: Color(red: 0.30, green: 0.55, blue: 0.85)
        ),
        InfoStep(
            title: "Assess Burns",
            instruction: "For burns, gently flush the area with cool water for several minutes. " +
                         "Do not apply ice, creams, or ointments.",
            audio: "Cool burns gently with water. Do not apply creams.",
            illustrationIcon: "flame.fill",
            illustrationColor: Color(red: 0.95, green: 0.45, blue: 0.20)
        ),
        InfoStep(
            title: "Emergency Vet Care",
            instruction: "All heatstroke, severe hypothermia, or burn injuries require veterinary evaluation. " +
                         "Transport your dog to an emergency clinic immediately.",
            audio: "Seek emergency veterinary care immediately.",
            illustrationIcon: "cross.case.fill",
            illustrationColor: Color(red: 0.85, green: 0.15, blue: 0.15)
        )
    ]

    var body: some View {
        EmergencyFlowView(
            steps: steps,
            navigationTitle: "Temperature & Burns",
            paginationAccentColor: Color(red: 0.90, green: 0.35, blue: 0.25)
        )
    }
}

struct TemperatureBurnsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
        TemperatureBurnsView()
        }
    }
}

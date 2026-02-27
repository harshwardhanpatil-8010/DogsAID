import SwiftUI

enum EmergencyRouter {

    @MainActor @ViewBuilder
    static func destination(for route: EmergencyRoute) -> some View {
        switch route {
        case .dogCPR:                DogCPREmergencyView()
        case .choking:               ChokingEmergencyView()
        case .drowning:              DrowningEmergencyView()
        case .bloat:                 BloatView()
        case .anaphylaxis:           AnaphylaxisView()

        case .bleedingControl:       BleedingControlView()
        case .fractures:             FracturesView()
        case .hitByCar:              HitByCarView()
        case .temperatureBurns:      TemperatureBurnsView()
        case .electricShock:         ElectricShockView()
        case .eyeInjuries:           EyeInjuriesView()

        case .poisonExposure:        PoisonExposureView()
        case .plantPoisoning:        PlantPoisoningView()
        case .foodPoisoning:         FoodPoisoningView()
        case .snakeBitesStings:      SnakeBitesStingsView()

        case .seizures:              SeizuresView()
        case .heatstroke:            HeatstrokeView()
        case .frostbiteHypothermia:  FrostbiteHypothermiaView()
        case .blueGums:              BlueGumsView()
        case .breathingDifficulty:   BreathingDifficultyView()
        case .urinaryBlockage:       UrinaryBlockageView()

        case .pregnancyWhelping:     PregnancyWhelpingEmergencyView()
        case .vomiting:              VomitingView()
        }
    }
}

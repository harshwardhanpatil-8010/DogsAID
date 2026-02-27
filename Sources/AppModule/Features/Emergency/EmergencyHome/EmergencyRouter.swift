import SwiftUI

enum EmergencyRouter {

    @MainActor @ViewBuilder
    static func destination(for route: EmergencyRoute) -> some View {
        if let view = lifeThreateningDestination(for: route) {
            view
        } else if let view = traumaDestination(for: route) {
            view
        } else if let view = toxinsDestination(for: route) {
            view
        } else if let view = symptomsDestination(for: route) {
            view
        } else {
            careDestination(for: route)
        }
    }

    @MainActor
    private static func lifeThreateningDestination(for route: EmergencyRoute) -> AnyView? {
        switch route {
        case .dogCPR:      return AnyView(DogCPREmergencyView())
        case .choking:     return AnyView(ChokingEmergencyView())
        case .drowning:    return AnyView(DrowningEmergencyView())
        case .bloat:       return AnyView(BloatView())
        case .anaphylaxis: return AnyView(AnaphylaxisView())
        default:           return nil
        }
    }

    @MainActor
    private static func traumaDestination(for route: EmergencyRoute) -> AnyView? {
        switch route {
        case .bleedingControl:  return AnyView(BleedingControlView())
        case .fractures:        return AnyView(FracturesView())
        case .hitByCar:         return AnyView(HitByCarView())
        case .temperatureBurns: return AnyView(TemperatureBurnsView())
        case .electricShock:    return AnyView(ElectricShockView())
        case .eyeInjuries:      return AnyView(EyeInjuriesView())
        default:                return nil
        }
    }

    @MainActor
    private static func toxinsDestination(for route: EmergencyRoute) -> AnyView? {
        switch route {
        case .poisonExposure:   return AnyView(PoisonExposureView())
        case .plantPoisoning:   return AnyView(PlantPoisoningView())
        case .foodPoisoning:    return AnyView(FoodPoisoningView())
        case .snakeBitesStings: return AnyView(SnakeBitesStingsView())
        default:                return nil
        }
    }

    @MainActor
    private static func symptomsDestination(for route: EmergencyRoute) -> AnyView? {
        switch route {
        case .seizures:             return AnyView(SeizuresView())
        case .heatstroke:           return AnyView(HeatstrokeView())
        case .frostbiteHypothermia: return AnyView(FrostbiteHypothermiaView())
        case .blueGums:             return AnyView(BlueGumsView())
        case .breathingDifficulty:  return AnyView(BreathingDifficultyView())
        case .urinaryBlockage:      return AnyView(UrinaryBlockageView())
        default:                    return nil
        }
    }

    @MainActor @ViewBuilder
    private static func careDestination(for route: EmergencyRoute) -> some View {
        switch route {
        case .pregnancyWhelping: PregnancyWhelpingEmergencyView()
        case .vomiting:          VomitingView()
        default:                 EmptyView()
        }
    }
}

import SwiftUI

struct EmergencyTopicModel: Identifiable, Hashable {
    let id: UUID
    let title: String
    let icon: String
    let iconColor: Color
    let route: EmergencyRoute

    init(title: String, icon: String, iconColor: Color, route: EmergencyRoute) {
        self.id = UUID()
        self.title = title
        self.icon = icon
        self.iconColor = iconColor
        self.route = route
    }

    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    static func == (lhs: EmergencyTopicModel, rhs: EmergencyTopicModel) -> Bool { lhs.id == rhs.id }
}

enum EmergencyRoute: Hashable {
    case dogCPR
    case choking
    case drowning
    case bloat
    case anaphylaxis

    case bleedingControl
    case fractures
    case hitByCar
    case temperatureBurns
    case electricShock
    case eyeInjuries

    case poisonExposure
    case plantPoisoning
    case foodPoisoning
    case snakeBitesStings

    case seizures
    case heatstroke
    case frostbiteHypothermia
    case blueGums
    case breathingDifficulty
    case urinaryBlockage

    case pregnancyWhelping
    case vomiting
}

struct EmergencySection: Identifiable {
    let id = UUID()
    let title: String
    let topics: [EmergencyTopicModel]
}

enum EmergencyTopicCatalog {

    static let lifeThreatening: [EmergencyTopicModel] = [
        .init(title: "Dog CPR", icon: "heart.fill", iconColor: .red, route: .dogCPR),
        .init(title: "Choking", icon: "wind", iconColor: .orange, route: .choking),
        .init(title: "Bloat (GDV)", icon: "multiply.circle.fill", iconColor: .red, route: .bloat),
        .init(title: "Anaphylaxis", icon: "waveform.path.ecg", iconColor: .purple, route: .anaphylaxis),
        .init(title: "Drowning", icon: "drop.fill", iconColor: .blue, route: .drowning)
    ]

    static let traumaAndInjury: [EmergencyTopicModel] = [
        .init(title: "Bleeding Control", icon: "bandage.fill", iconColor: .red, route: .bleedingControl),
        .init(title: "Fractures & Sprains", icon: "staroflife.fill", iconColor: .brown, route: .fractures),
        .init(title: "Hit By Car", icon: "car.fill", iconColor: .purple, route: .hitByCar),
        .init(title: "Burns & Temperature Injury", icon: "thermometer.sun.fill", iconColor: .orange, route: .temperatureBurns),
        .init(title: "Electric Shock", icon: "bolt.fill", iconColor: .yellow, route: .electricShock),
        .init(title: "Eye Injuries", icon: "eye.trianglebadge.exclamationmark.fill", iconColor: .red, route: .eyeInjuries)
    ]

    static let toxinsAndIngestion: [EmergencyTopicModel] = [
        .init(title: "Poison Exposure", icon: "exclamationmark.triangle.fill", iconColor: .purple, route: .poisonExposure),
        .init(title: "Plant Poisoning", icon: "leaf.fill", iconColor: .green, route: .plantPoisoning),
        .init(title: "Food Poisoning", icon: "pills.fill", iconColor: .purple, route: .foodPoisoning),
        .init(title: "Snake Bites & Stings", icon: "ant.fill", iconColor: .red, route: .snakeBitesStings)
    ]

    static let criticalSymptoms: [EmergencyTopicModel] = [
        .init(title: "Seizures", icon: "brain.head.profile", iconColor: .pink, route: .seizures),
        .init(title: "Heatstroke", icon: "flame.fill", iconColor: .orange, route: .heatstroke),
        .init(title: "Frostbite & Hypothermia", icon: "snowflake", iconColor: .blue, route: .frostbiteHypothermia),
        .init(title: "Blue Gums", icon: "lungs.fill", iconColor: .blue, route: .blueGums),
        .init(title: "Breathing Difficulty", icon: "waveform.path", iconColor: .cyan, route: .breathingDifficulty),
        .init(title: "Urinary Blockage", icon: "exclamationmark.triangle.fill", iconColor: .red, route: .urinaryBlockage)
    ]

    static let careAndWhelping: [EmergencyTopicModel] = [
        .init(title: "Pregnancy & Whelping", icon: "heart.circle.fill", iconColor: .pink, route: .pregnancyWhelping),
        .init(title: "Minor Vomiting", icon: "cross.vial.fill", iconColor: .blue, route: .vomiting)
    ]

    static let sections: [EmergencySection] = [
        EmergencySection(title: "Life-Threatening", topics: lifeThreatening),
        EmergencySection(title: "Trauma & Injury", topics: traumaAndInjury),
        EmergencySection(title: "Toxins & Ingestion", topics: toxinsAndIngestion),
        EmergencySection(title: "Critical Symptoms", topics: criticalSymptoms),
        EmergencySection(title: "Care & Whelping", topics: careAndWhelping)
    ]

    static let allTopics: [EmergencyTopicModel] = sections.flatMap(\.topics)
}

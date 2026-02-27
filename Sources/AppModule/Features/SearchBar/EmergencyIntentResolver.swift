import Foundation
import NaturalLanguage

enum EmergencyIntent: Hashable {
    case dogCPR
    case choking
    case drowning
    case bloat
    case anaphylaxis

    case bleeding
    case fractures
    case hitByCar
    case temperature
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
    case pregnancy
    case vomiting

    case unknownEmergency
}

struct EmergencyIntentResolver {

    private static let keywordMap: [EmergencyIntent: [String]] = [
        .dogCPR: ["not breathing", "no heartbeat", "collapsed", "unconscious", "cpr"],
        .choking: ["choking", "stuck", "object in throat", "can't breathe"],
        .drowning: ["drowning", "fell in water", "pulled from water", "pool", "river"],
        .bloat: ["bloat", "gdv", "swollen belly", "retching", "distended abdomen"],
        .anaphylaxis: ["anaphylaxis", "allergic reaction", "facial swelling", "hives"],

        .bleeding: ["bleeding", "blood", "cut", "wound", "hemorrhage"],
        .fractures: ["fracture", "broken leg", "limping", "sprain"],
        .hitByCar: ["hit by car", "accident", "road injury"],
        .temperature: ["burn", "heatstroke", "overheated", "hypothermia", "temperature"],
        .electricShock: ["electric shock", "electrocuted", "chewed wire", "power cord"],
        .eyeInjuries: ["eye injury", "bulging eye", "scratched eye", "eye bleeding"],

        .poisonExposure: ["poison", "chemical", "antifreeze", "rat poison"],
        .plantPoisoning: ["plant", "toxic plant", "leaf", "flower"],
        .foodPoisoning: ["chocolate", "grapes", "raisins", "xylitol", "ate something"],
        .snakeBitesStings: ["snake bite", "snake", "bee sting", "wasp", "insect sting"],

        .seizures: ["seizure", "convulsions", "fits"],
        .heatstroke: ["heatstroke", "overheated", "excessive panting"],
        .frostbiteHypothermia: ["frostbite", "freezing", "hypothermia", "cold"],
        .blueGums: ["blue gums", "purple gums", "cyanosis"],
        .breathingDifficulty: ["coughing", "gagging", "retching"],

        .urinaryBlockage: ["cannot pee", "straining to urinate", "urinary blockage"],
        .pregnancy: ["pregnant", "labor", "whelping"],
        .vomiting: ["vomiting", "threw up", "nausea"],
        .unknownEmergency: [
            "help",
            "emergency",
            "something wrong",
            "not acting normal",
            "i don't know",
            "dont know",
            "unknown",
            "urgent"
        ]
    ]

    static func resolve(from input: String) -> EmergencyIntent? {
        let normalized = normalize(input)
        for (intent, keywords) in keywordMap where keywords.contains(where: { normalized.contains($0) }) {
            return intent
        }
        return nil
    }

    static func route(for intent: EmergencyIntent) -> EmergencyRoute {
        let mapping: [EmergencyIntent: EmergencyRoute] = [
            .dogCPR: .dogCPR,
            .choking: .choking,
            .drowning: .drowning,
            .bloat: .bloat,
            .anaphylaxis: .anaphylaxis,
            .bleeding: .bleedingControl,
            .fractures: .fractures,
            .hitByCar: .hitByCar,
            .temperature: .temperatureBurns,
            .electricShock: .electricShock,
            .eyeInjuries: .eyeInjuries,
            .poisonExposure: .poisonExposure,
            .plantPoisoning: .plantPoisoning,
            .foodPoisoning: .foodPoisoning,
            .snakeBitesStings: .snakeBitesStings,
            .seizures: .seizures,
            .heatstroke: .heatstroke,
            .frostbiteHypothermia: .frostbiteHypothermia,
            .blueGums: .blueGums,
            .breathingDifficulty: .breathingDifficulty,
            .urinaryBlockage: .urinaryBlockage,
            .pregnancy: .pregnancyWhelping,
            .vomiting: .vomiting,
            .unknownEmergency: .dogCPR
        ]
        return mapping[intent] ?? .dogCPR
    }

    private static func normalize(_ input: String) -> String {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = input.lowercased()
        var result = ""
        tagger.enumerateTags(in: input.startIndex..<input.endIndex, unit: .word, scheme: .lemma) { tag, _ in
            if let lemma = tag?.rawValue {
                result.append(lemma)
                result.append(" ")
            }
            return true
        }
        return result.trimmingCharacters(in: .whitespaces)
    }
}

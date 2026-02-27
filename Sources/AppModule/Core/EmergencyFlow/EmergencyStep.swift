

import SwiftUI

// MARK: - EmergencyStep


public protocol EmergencyStep: Identifiable {

    var title: String { get }
    var instruction: String { get }
    var audio: String { get }
    var illustrationColor: Color { get }
    var illustrationIcon: String? { get }
    var isInteractive: Bool { get }
    var sizeGuidance: SizeGuidance? { get }
}

// MARK: - Default implementations

public extension EmergencyStep {
    var illustrationIcon: String? { nil }
    var isInteractive: Bool { false }
    var sizeGuidance: SizeGuidance? { nil }
}

// MARK: - SizeGuidance  (shared, moved out of CPRStep.swift)

public struct SizeGuidance {
    public let smallDog: String
    public let largeDog: String

    public init(smallDog: String, largeDog: String) {
        self.smallDog = smallDog
        self.largeDog = largeDog
    }
}

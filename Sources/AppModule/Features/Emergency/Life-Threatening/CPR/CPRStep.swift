import SwiftUI

// MARK: - CPRStepKind

public enum CPRStepKind {
    case info
    case cpr
}

// MARK: - CPRStep

public struct CPRStep: Identifiable, EmergencyStep {
    public let id = UUID()

    public let title: String
    public let instruction: String
    public let audio: String
    public let illustrationColor: Color
    public let sizeGuidance: SizeGuidance?

    public let kind: CPRStepKind

    public let illustrationIcon: String?

    public var isInteractive: Bool { kind == .cpr }

    public var isCPR: Bool { kind == .cpr }

    public init(
        title: String,
        instruction: String,
        audio: String,
        sizeGuidance: SizeGuidance? = nil,
        illustrationIcon: String? = nil,
        illustrationColor: Color,
        kind: CPRStepKind
    ) {
        self.title             = title
        self.instruction       = instruction
        self.audio             = audio
        self.sizeGuidance      = sizeGuidance
        self.illustrationIcon  = illustrationIcon
        self.illustrationColor = illustrationColor
        self.kind              = kind
    }
}

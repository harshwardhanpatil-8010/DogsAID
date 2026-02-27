import SwiftUI

// MARK: - EmergencyAudioStopAction
struct EmergencyAudioStopAction {

    var action: () -> Void = {}

    func callAsFunction() { action() }
}

private struct EmergencyAudioStopKey: EnvironmentKey {
    nonisolated(unsafe) static let defaultValue = EmergencyAudioStopAction()
}

extension EnvironmentValues {
    var stopEmergencyAudio: EmergencyAudioStopAction {
        get { self[EmergencyAudioStopKey.self] }
        set { self[EmergencyAudioStopKey.self] = newValue }
    }
}

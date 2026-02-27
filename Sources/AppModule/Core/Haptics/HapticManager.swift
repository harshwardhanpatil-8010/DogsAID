import UIKit
import AVFoundation

enum Haptic {

    @MainActor
    static func tap() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            AudioServicesPlaySystemSound(1104)
        } else {
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }

    @MainActor
    static func success() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            AudioServicesPlaySystemSound(1407) 
        } else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
}

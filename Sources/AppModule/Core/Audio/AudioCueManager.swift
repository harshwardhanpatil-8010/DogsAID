import AVFoundation

@MainActor
final class AudioCueManager: NSObject, ObservableObject {

    private let synthesizer = AVSpeechSynthesizer()

    // MARK: Callbacks

    var onFinished: (() -> Void)?
    var onWillSpeak: ((NSRange, Int) -> Void)?

    // MARK: Private

    private var isCancelling             = false
    private var shouldDeactivateOnCancel = false
    private var currentTextLength        = 0

    override init() {
        super.init()
        synthesizer.delegate = self

        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            mode: .default,
            options: [.mixWithOthers, .duckOthers]
        )
        try? AVAudioSession.sharedInstance().setActive(true)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleInterruption),
            name: AVAudioSession.interruptionNotification,
            object: AVAudioSession.sharedInstance()
        )
    }

    @objc private func handleInterruption(_ notification: Notification) {
        guard
            let info      = notification.userInfo,
            let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type      = AVAudioSession.InterruptionType(rawValue: typeValue),
            type == .began
        else { return }
        pause()
    }

    // MARK: Public API

    func speak(_ text: String) {
        isCancelling             = true
        shouldDeactivateOnCancel = false
        synthesizer.stopSpeaking(at: .immediate)
        isCancelling             = false

        currentTextLength = text.count

        let utterance             = AVSpeechUtterance(string: text)
        utterance.voice           = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate            = 0.5
        utterance.pitchMultiplier = 1.5
        utterance.volume          = 0.8
        synthesizer.speak(utterance)
    }

    func pause() {
        isCancelling             = true
        shouldDeactivateOnCancel = false
        synthesizer.stopSpeaking(at: .immediate)
        isCancelling             = false
    }

    func stop() {
        isCancelling             = true
        shouldDeactivateOnCancel = true
        synthesizer.stopSpeaking(at: .immediate)

    }
}

// MARK: - AVSpeechSynthesizerDelegate

extension AudioCueManager: @preconcurrency AVSpeechSynthesizerDelegate {

    @MainActor func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        willSpeakRangeOfSpeechString characterRange: NSRange,
        utterance: AVSpeechUtterance
    ) {
        guard !isCancelling else { return }
        onWillSpeak?(characterRange, currentTextLength)
    }

    @MainActor func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didFinish utterance: AVSpeechUtterance
    ) {
        if shouldDeactivateOnCancel {

            shouldDeactivateOnCancel = false
            isCancelling             = false
            return
        }
        guard !isCancelling else { return }
        DispatchQueue.main.async { [weak self] in
            self?.onFinished?()
        }
    }

    @MainActor func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didCancel utterance: AVSpeechUtterance
    ) {
        if shouldDeactivateOnCancel {
            shouldDeactivateOnCancel = false
            isCancelling             = false
        }
    }
}

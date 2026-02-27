import AVFoundation

final class MetronomeManager {

    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    private let sampleRate: Double = 44100
    private lazy var format = AVAudioFormat(
        standardFormatWithSampleRate: sampleRate, channels: 1
    )!
    private lazy var beatBuffer: AVAudioPCMBuffer = makeBeatBuffer()

    private var timerSrc: DispatchSourceTimer?
    private let timerQueue = DispatchQueue(label: "cpr.metronome", qos: .userInteractive)

    init() {
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: format)
    }

    // MARK: - Public API

    func start(bpm: Double) {
        stop()

        guard !engine.isRunning else { return }
        do {
            try engine.start()
        } catch {
            print("MetronomeManager: engine failed to start — \(error)")
            return
        }

        let interval = 60.0 / bpm
        let src = DispatchSource.makeTimerSource(queue: timerQueue)
        src.schedule(deadline: .now(), repeating: interval, leeway: .milliseconds(2))
        src.setEventHandler { [weak self] in
            guard let self, self.engine.isRunning else { return }
            self.player.scheduleBuffer(self.beatBuffer, at: nil, options: .interrupts)
            if !self.player.isPlaying { self.player.play() }
        }
        src.resume()
        timerSrc = src
    }

    func stop() {
        timerSrc?.cancel()
        timerSrc = nil
        if player.isPlaying { player.stop() }
        if engine.isRunning { engine.stop() }
    }

    // MARK: - Sound design

    private func makeBeatBuffer() -> AVAudioPCMBuffer {
        let duration = 0.12
        let frames = AVAudioFrameCount(sampleRate * duration)
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frames)!
        buffer.frameLength = frames

        let data = buffer.floatChannelData![0]
        let sampleRateFloat = Float(sampleRate)
        let attackFrames = Int(sampleRateFloat * 0.002)

        for index in 0..<Int(frames) {
            let time = Float(index) / sampleRateFloat

            let envelope: Float
            if index < attackFrames {
                envelope = Float(index) / Float(attackFrames)
            } else {
                envelope = exp(-6.0 * Float(index - attackFrames) / (sampleRateFloat * Float(duration)))
            }

            let body = sin(2 * .pi * 65 * time)
            let transient = sin(2 * .pi * 180 * time) * 0.4 * exp(-18.0 * time / Float(duration))

            data[index] = (body + transient) * envelope * 0.75
        }
        return buffer
    }
}

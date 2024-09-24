import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer? = AVAudioPlayer()

func playSound(sound: String, type: String = "", volume: Float = 1.0) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(volume, fadeDuration: 0.1)
            audioPlayer?.play()
        }catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

func stopSound() {
    audioPlayer?.stop()
}

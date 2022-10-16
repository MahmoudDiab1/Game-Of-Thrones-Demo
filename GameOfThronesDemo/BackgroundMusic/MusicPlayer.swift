//
//  MusicPlayer.swift
//  GOT
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import AVFoundation

// MARK: Track Types -
enum MP3Track{
    case GOTBackground
    
    var fileName: String {
        switch self {
        case .GOTBackground:
            let fileName = "GOT"
            return fileName
        }
    }
}

// MARK: MusicPlayer -
protocol MusicPlayer {
    mutating func startBackgroundMusic(_ track: MP3Track)
    func stopBackgroundMusic()
}

struct DefaultMusicPlayer: MusicPlayer{
    
    // MARK: Properties -
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: Functions -
    mutating func startBackgroundMusic(_ track: MP3Track) {
        if let bundle = Bundle.main.path(forResource: track.fileName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}

// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false

    init() {
        // Initialize the audio player
        if let audioFilePath = Bundle.main.path(forResource: "sample", ofType: "mp3") {
            let audioFileURL = URL(fileURLWithPath: audioFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                // audioPlayer?.delegate = self
            } catch {
                print("Error initializing audio player: \(error)")
            }
        }
    }

    func togglePlayback() {
        if let player = audioPlayer {
            if player.isPlaying {
                player.pause()
            } else {
                player.play()
            }
            isPlaying = player.isPlaying
        }
    }
}

//extension AudioPlayerViewModel: AVAudioPlayerDelegate {
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        if flag {
//            // Audio playback finished successfully
//            isPlaying = false
//        }
//    }
//}

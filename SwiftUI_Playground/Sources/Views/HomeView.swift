//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

final class AudioPlayer: ObservableObject {
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct HomeView: View {
    @StateObject private var audioPlayer = AudioPlayer()

    var body: some View {
        VStack {
            Button(action: {
                audioPlayer.playSound()
            }) {
                Text("Play Sound")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

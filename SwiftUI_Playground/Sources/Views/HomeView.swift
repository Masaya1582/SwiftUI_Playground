//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var isPlaying = false
    @State private var currentTime: Double = 0
    @State private var duration: Double = 100
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            // Album Artwork
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()

            // Song Title and Artist
            Text("Song Title")
                .font(.title)
                .padding(.top, 10)

            Text("Artist Name")
                .font(.subheadline)
                .foregroundColor(.gray)

            // Slider for Progress
            Slider(value: $currentTime, in: 0...duration, onEditingChanged: { _ in
                // Update the player's current time when user interacts with the slider
                if let player = audioPlayer {
                    player.currentTime = currentTime
                }
            })
            .padding()

            // Current Time and Duration
            HStack {
                Text(formatTime(seconds: currentTime))
                    .font(.caption)
                Spacer()
                Text(formatTime(seconds: duration))
                    .font(.caption)
            }
            .padding([.leading, .trailing])

            // Control Buttons
            HStack(spacing: 40) {
                // Previous Button
                Button(action: {
                    // Handle Previous Action
                    print("Previous pressed")
                }) {
                    Image(systemName: "backward.fill")
                        .font(.largeTitle)
                }

                // Play/Pause Button
                Button(action: {
                    if isPlaying {
                        audioPlayer?.pause()
                    } else {
                        audioPlayer?.play()
                    }
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                }

                // Next Button
                Button(action: {
                    // Handle Next Action
                    print("Next pressed")
                }) {
                    Image(systemName: "forward.fill")
                        .font(.largeTitle)
                }
            }
            .padding(.top, 30)
        }
        .onAppear {
            setupAudioPlayer()
        }
    }

    // Helper Method to Format Time in mm:ss
    private func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Setup Audio Player
    private func setupAudioPlayer() {
        if let path = Bundle.main.path(forResource: "bgm", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                duration = audioPlayer?.duration ?? 100
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    if let player = audioPlayer {
                        currentTime = player.currentTime
                    }
                }
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
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

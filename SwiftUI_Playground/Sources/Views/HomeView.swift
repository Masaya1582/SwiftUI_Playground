//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var audioPlayerNode = AVAudioPlayerNode()
    @State private var audioEngine = AVAudioEngine()
    @State private var speedControl = AVAudioUnitVarispeed()
    @State private var pitchControl = AVAudioUnitTimePitch()
    @State private var isPause = false

    var body: some View {
        VStack {
            HStack {
                Button("Start") {
                    guard let url = Bundle.main.url(forResource: "work_life_balance", withExtension: "mp3") else { return }
                    guard let file = try? AVAudioFile(forReading: url) else { return }

                    audioPlayerNode = AVAudioPlayerNode()

                    audioEngine.attach(audioPlayerNode)
                    audioEngine.attach(pitchControl)
                    audioEngine.attach(speedControl)

                    audioEngine.connect(audioPlayerNode, to: speedControl, format: nil)
                    audioEngine.connect(speedControl, to: pitchControl, format: nil)
                    audioEngine.connect(pitchControl, to: audioEngine.mainMixerNode, format: nil)
                    audioPlayerNode.scheduleFile(file, at: nil)

                    try? audioEngine.start()
                    audioPlayerNode.play()
                }.padding()

                Button("Pause") {
                    if isPause {
                        audioPlayerNode.play()
                    } else {
                        audioPlayerNode.pause()
                    }
                    isPause.toggle()
                }.padding()

                Button("Stop") {
                    audioPlayerNode.volume = 0
                }.padding()
            }

            HStack {
                Button("Rate↑") {
                    pitchControl.rate += 0.1
                }.padding()

                Button("Rate↓") {
                    pitchControl.rate -= 0.1
                }.padding()
            }

            HStack {
                Button("Pitch↑") {
                    pitchControl.pitch += 50
                }.padding()

                Button("Pitch↓") {
                    pitchControl.pitch -= 50
                }.padding()
            }

            HStack {
                Button("Rate&Pitch↑") {
                    speedControl.rate += 0.1
                }.padding()

                Button("Rate&Pitch↓") {
                    speedControl.rate -= 0.1
                }.padding()
            }

            HStack {
                Button("Volume↑") {
                    audioPlayerNode.volume += 0.2
                }.padding()

                Button("Volume↓") {
                    audioPlayerNode.volume -= 0.2
                }.padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

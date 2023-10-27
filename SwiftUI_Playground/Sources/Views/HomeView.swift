//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var count = 0
    @State private var isShowAho = false
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Spacer()
            Text(String(count))
                .modifier(CustomLabel(foregroundColor: .black, size: 32))
            if isShowAho {
                Asset.Assets.nabeatsu.swiftUIImage
                    .resizable()
                    .modifier(CustomImage(width: 280, height: 280))
            }
            Spacer()
            Button("Increment") {
                incrementCount()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .onAppear {
            setupAudioPlayer()
        }
    }

    private func incrementCount() {
        count += 1
        if count.isMultiple(of: 3) || String(count).contains("3") {
            isShowAho = true
            audioPlayer?.play()
        } else {
            isShowAho = false
        }
    }

    private func setupAudioPlayer() {
        guard let audioPath = Bundle.main.path(forResource: "three_aho", ofType: "mp3") else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

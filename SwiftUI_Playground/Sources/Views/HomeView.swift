//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var avPlayer: AVPlayer?
    var body: some View {
        VStack {
            Button {
                playOnlineFile()
            } label: {
                Text("Play Online File")
            }
        }
    }

    private func playOnlineFile() {
        guard let url = URL(string: "https://masasophi.com/wp-content/uploads/2023/07/swift.wav") else { fatalError("File wan't found")}
        let playerItem = AVPlayerItem(url: url)
        avPlayer = AVPlayer(playerItem: playerItem)
        avPlayer?.play()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

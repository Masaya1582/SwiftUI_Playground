//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @State private var isVideoPickerPresented = false
    @State private var selectedVideoURL: URL?
    @State private var player = AVPlayer()

    var body: some View {
        VStack {
            if let selectedVideoURL = selectedVideoURL {
                VideoPlayer(player: player)
                    .onAppear {
                        player = AVPlayer(url: selectedVideoURL)
                        player.play()
                    }
            } else {
                Text("Select a video to play")
            }
            Button(action: {
                isVideoPickerPresented = true
            }) {
                Text("Select Video")
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .frame(height: 44)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $isVideoPickerPresented) {
            VideoPicker { url in
                selectedVideoURL = url
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

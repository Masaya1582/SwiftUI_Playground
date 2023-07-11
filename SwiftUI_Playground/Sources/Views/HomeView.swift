//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVKit

struct HomeView: View {
    var body: some View {
        if let videoURL = Bundle.main.url(forResource: "River", withExtension: "MOV") {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        } else {
            Text("Video not found")
                .foregroundColor(.red)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

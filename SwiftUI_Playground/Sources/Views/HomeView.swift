//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    static let emoji = ["😀", "😬", "😄", "🙂", "😗", "🤓", "😏", "😕", "😟", "😎", "😜", "😍", "🤪"]

    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.2)) { timeline in
            HStack(spacing: 120) {
                let randomEmoji = HomeView.emoji.randomElement() ?? ""
                Text(randomEmoji)
                    .font(.largeTitle)
                    .scaleEffect(4.0)
                SubView()
            }
        }
    }
}

struct SubView: View {
    var body: some View {
        let randomEmoji = HomeView.emoji.randomElement() ?? ""
        Text(randomEmoji)
            .font(.largeTitle)
            .scaleEffect(4.0)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

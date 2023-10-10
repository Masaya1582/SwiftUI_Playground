//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let link: URL

    init() {
        if let url = URL(string: "https://www.hackingwithswift.com") {
            self.link = url
        } else {
            fatalError("Invalid URL")
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            ShareLink(item: link)
            ShareLink("Learn Swift here", item: link)
            ShareLink(item: link) {
                Label("Learn Swift here", systemImage: "swift")
            }
            ShareLink(
                item: link,
                preview: SharePreview(
                    "Switzerland's flag: it's a big plus.",
                    image: Image(systemName: "plus")
                )
            )
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

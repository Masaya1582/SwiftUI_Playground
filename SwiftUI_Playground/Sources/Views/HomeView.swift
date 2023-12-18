//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
   private let url = URL(string: "https://developer.apple.com")!

    var body: some View {
        VStack {
            Text("This is a link:")
            Link(destination: url) {
                Text("Apple")
            }
            Text("It looks like a button, Acts like a button, but is modifiable like text.")
            Divider()
            Link(destination: url) {
                Text("Caption style text link")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
            }
            Divider()
            Link(destination: url) {
                Image(systemName: "link")
                    .font(.title.bold())
                Text("Large Title link")
                    .font(.largeTitle.bold())
            }
            Divider()
            Text("This is an inline [link](https://developer.apple.com), and some more text here to show how its inline, this is accomplished using markdown.")
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var shouldInvertColor = false

    var body: some View {
        VStack {
            Text("Bouncing Ball Animation")
                .font(.largeTitle)
                .padding()

            BouncingBallView()
                .padding()

            Text("Watch the ball bounce!")
                .font(.headline)
                .foregroundColor(.gray)
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

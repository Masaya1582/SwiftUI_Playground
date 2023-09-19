//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        Circle()
            .scaleEffect(viewModel.isTapped ? 2 : 1)
            .foregroundColor(.orange)
            .frame(width: 100, height: 100)
            .animation(.easeInOut(duration: 0.3))
            .onTapGesture {
                viewModel.isTapped.toggle()
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

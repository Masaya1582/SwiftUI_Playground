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
        GeometryReader { geometry in
            HStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width / 3)

                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width / 3)

                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width / 3)
            }
        }
        .edgesIgnoringSafeArea(.all)
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

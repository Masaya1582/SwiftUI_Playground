//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = FlatMapViewModel()

    var body: some View {
        VStack {
            Text("Perform FlatMap Operation")
                .font(.title)
                .padding()
            Button("FlatMap") {
                viewModel.performFlatMap()
            }
            .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

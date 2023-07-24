//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            TextField("Search Pokemon", text: $viewModel.searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(viewModel.searchResults, id: \.name) { pokemon in
                Text("\(pokemon.name) - \(pokemon.type)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

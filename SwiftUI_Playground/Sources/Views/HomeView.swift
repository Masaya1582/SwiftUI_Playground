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
            Button("Merge Pokemons") {
                viewModel.mergePokemons()
            }
            List(viewModel.allPokemons, id: \.name) { pokemon in
                Text("\(pokemon.name) - \(pokemon.type)")
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

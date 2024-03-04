//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                Text(pokemon.name.capitalized)
            }
            .navigationTitle("Pokémon")
            .onAppear {
                viewModel.fetchPokemonList()
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                }
            }
            .navigationTitle("Pokémon")
            .onAppear {
                viewModel.loadPokemon()
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

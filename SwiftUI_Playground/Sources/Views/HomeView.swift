//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemonList) { pokemon in
                HStack {
                    AsyncImage(url: pokemon.sprites.front_default) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(pokemon.name.capitalized)
                        .font(.headline)
                }
            }
            .navigationTitle("Pokémon")
            .onAppear {
                viewModel.fetchPokemon()
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

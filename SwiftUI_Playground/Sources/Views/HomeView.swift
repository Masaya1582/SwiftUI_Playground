//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemonList) { pokemon in
                Text(pokemon.name.capitalized)
            }
            .navigationTitle("Pokémon List")
            .onAppear {
                viewModel.fetchPokemon()
            }
//            .alert(item: $viewModel.errorMessage) { errorMessage in
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
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

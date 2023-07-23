//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

protocol PokemonSelectionDelegate {
    func didSelectPokemon(_ pokemon: Pokemon)
}

struct HomeView: View {
    @State private var selectedPokemon: Pokemon?
    private let pokemons = [
        Pokemon(name: "Bulbasaur", type: "Grass/Poison"),
        Pokemon(name: "Charmander", type: "Fire"),
        Pokemon(name: "Squirtle", type: "Water")
    ]

    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: DetailView(pokemon: pokemon, delegate: self)) {
                    Text(pokemon.name)
                        .font(.headline)
                }
            }
            .navigationBarTitle("Pokémon List")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension HomeView: PokemonSelectionDelegate {
    func didSelectPokemon(_ pokemon: Pokemon) {
        selectedPokemon = pokemon
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pokemons: [Pokemon] = [
        RegularPokemon(name: "Bulbasaur", type: "Grass", ability: "Overgrow - Powers up Grass-type moves in a pinch."),
        RegularPokemon(name: "Charmander", type: "Fire", ability: "Blaze - Powers up Fire-type moves in a pinch."),
        LegendaryPokemon(name: "Articuno", type: "Ice/Flying", description: "A legendary bird Pokémon that can control ice."),
        LegendaryPokemon(name: "Mewtwo", type: "Psychic", description: "It was created based on the DNA of a Pokémon called Mew.")
    ]

    var body: some View {
        NavigationView {
            PokemonListView(pokemons: pokemons)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Pokemons {
    let name: String
    let type: String
    let description: String
}

struct HomeView: View {
    private let pokemonArray = [
        Pokemons(name: "Pikachu", type: "Electric", description: "A cute and powerful Electric-type Pokémon."),
        Pokemons(name: "Bulbasaur", type: "Grass/Poison", description: "A Grass/Poison-type Pokémon with a plant on its back."),
        Pokemons(name: "Charmander", type: "Fire", description: "A Fire-type Pokémon with a flame on its tail.")
    ]
    private let additionalInfo: [String: String] = [
        "Pikachu": "Pikachu is known for its electric abilities and lightning-fast speed.",
        "Bulbasaur": "Bulbasaur can use its plant bulb to absorb sunlight and grow stronger.",
        "Charmander": "Charmander's flame on its tail indicates its health and emotions."
    ]

    var body: some View {
        NavigationView {
            List(pokemonArray, id: \.name) { pokemon in
                NavigationLink(destination: PokemonDetail(pokemon: pokemon, additionalInfo: additionalInfo[pokemon.name] ?? "")) {
                    Text(pokemon.name)
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                }
            }
        }

    }
}

struct PokemonDetail: View {
    let pokemon: Pokemons
    let additionalInfo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Text(pokemon.name)
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Text(pokemon.description)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text(additionalInfo)
                .modifier(CustomLabel(foregroundColor: .gray, size: 16))
            Spacer()
        }
        .navigationTitle("Details")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

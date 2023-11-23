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
}

struct HomeView: View {
    private let pokemons = [
        Pokemons(name: "Pikachu", type: "Electric"),
        Pokemons(name: "Bulbasaur", type: "Grass"),
        Pokemons(name: "Charmander", type: "Fire"),
        Pokemons(name: "Squirtle", type: "Water"),
        Pokemons(name: "Jigglypuff", type: "Normal"),
        Pokemons(name: "Gyarados", type: "Water"),
        Pokemons(name: "Alakazam", type: "Psychic"),
        Pokemons(name: "Gengar", type: "Ghost"),
        Pokemons(name: "Dragonite", type: "Dragon"),
        Pokemons(name: "Mewtwo", type: "Psychic"),
        Pokemons(name: "Snorlax", type: "Normal"),
        Pokemons(name: "Eevee", type: "Normal"),
        Pokemons(name: "Magikarp", type: "Water"),
        Pokemons(name: "Machamp", type: "Fighting"),
        Pokemons(name: "Vaporeon", type: "Water")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(pokemons, id: \.name) { pokemon in
                    PokemonRowView(pokemon: pokemon)
                }
            }
            .padding()
        }
    }
}

struct PokemonRowView: View {
    let pokemon: Pokemons

    var body: some View {
        HStack {
            Text(pokemon.name)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(getBackgroundColor(for: pokemon.type))
                .cornerRadius(12)
            Spacer()
        }
    }

    private func getBackgroundColor(for type: String) -> Color {
        let typeColors: [String: Color] = [
            "electric": Color.yellow,
            "grass": Color.green,
            "fire": Color.red,
            "water": Color.blue
        ]

        if let color = typeColors[type.lowercased()] {
            return color
        } else {
            let randomColor = Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
            )
            return randomColor
        }
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

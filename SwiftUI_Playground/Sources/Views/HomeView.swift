//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let pokemonCollection = [
        Pokemon(id: 1, name: "Pikachu", type: "Electric"),
        Pokemon(id: 2, name: "Bulbasaur", type: "Grass/Poison"),
        Pokemon(id: 3, name: "Charmander", type: "Fire"),
        Pokemon(id: 4, name: "Squirtle", type: "Water"),
        Pokemon(id: 5, name: "Jigglypuff", type: "Normal/Fairy"),
        Pokemon(id: 6, name: "Meowth", type: "Normal"),
        Pokemon(id: 7, name: "Psyduck", type: "Water"),
        Pokemon(id: 8, name: "Snorlax", type: "Normal"),
        Pokemon(id: 9, name: "Eevee", type: "Normal"),
        Pokemon(id: 10, name: "Vulpix", type: "Fire"),
        Pokemon(id: 11, name: "Gengar", type: "Ghost/Poison"),
        Pokemon(id: 12, name: "Machop", type: "Fighting"),
        Pokemon(id: 13, name: "Geodude", type: "Rock/Ground"),
        Pokemon(id: 14, name: "Magikarp", type: "Water"),
        Pokemon(id: 15, name: "Growlithe", type: "Fire")
    ]

    var body: some View {
        NavigationView {
            List(pokemonCollection) { pokemon in
                NavigationLink(destination: DetailView(pokemon: pokemon)) {
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .modifier(CustomLabel(foregroundColor: .black, size: 20))
                        Text("Type: \(pokemon.type)")
                            .modifier(CustomLabel(foregroundColor: .gray, size: 16))
                    }
                }
            }
        }
        .navigationTitle("Pokemon Collection")
    }
}

struct DetailView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(spacing: 28) {
            Text(pokemon.name)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text("Type: \(pokemon.type)")
                .modifier(CustomLabel(foregroundColor: .gray, size: 16))
        }
        .navigationTitle(pokemon.name)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

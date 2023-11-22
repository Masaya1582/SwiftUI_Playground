//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pokemons = [
        Pokemon(name: "Pikachu", type: "Electric"),
        Pokemon(name: "Bulbasaur", type: "Grass"),
        Pokemon(name: "Charmander", type: "Fire"),
        Pokemon(name: "Squirtle", type: "Water")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Pokemon Types")
                    .font(.title)
                    .padding()
                Group {
                    TypeSection(title: "Electric", pokemons: filterPokemons(type: "Electric"))
                    TypeSection(title: "Fire", pokemons: filterPokemons(type: "Fire"))
                    TypeSection(title: "Water", pokemons: filterPokemons(type: "Water"))
                    TypeSection(title: "Grass", pokemons: filterPokemons(type: "Grass"))
                }
                .padding()
            }
            .navigationTitle("Pokemon Types")
        }
    }

    private func filterPokemons(type: String) -> [Pokemon] {
        return pokemons.filter { $0.type == type }
    }
}

struct TypeSection: View {
    let title: String
    let pokemons: [Pokemon]

    var body: some View {
        VStack {
            Text(title)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            ForEach(pokemons, id: \.name) { pokemon in
                Text(pokemon.name)
                    .modifier(CustomLabel(foregroundColor: .gray, size: 20))
            }
        }
        .padding()
        .cornerRadius(8)
        .frame(width: 300)
        .background(Color.gray.opacity(0.1))
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

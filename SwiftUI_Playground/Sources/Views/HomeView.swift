//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var pokedex = Pokedex()

    var body: some View {
        NavigationView {
            List {
                ForEach($pokedex.pokemonList) { $pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: $pokemon)) {
                        HStack {
                            Text(pokemon.name)
                            Spacer()
                            Image(systemName: pokemon.isCaught ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
        }
        .environmentObject(pokedex) // Inject Pokedex into the environment
    }
}

struct PokemonDetailView: View {
    @EnvironmentObject var pokedex: Pokedex // Access the Pokedex
    @Binding var pokemon: Pokemon // Binding to update the Pokemon's status

    var body: some View {
        VStack {
            Text("Name: \(pokemon.name)")
            Text("Type: \(pokemon.type)")
            Button("Catch") {
                if let index = pokedex.pokemonList.firstIndex(where: { $0.id == pokemon.id }) {
                    pokedex.pokemonList[index].isCaught.toggle()
                }
            }
        }
        .navigationTitle(pokemon.name)
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

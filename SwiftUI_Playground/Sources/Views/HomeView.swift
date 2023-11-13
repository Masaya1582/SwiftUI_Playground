//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    typealias PokemonEncounter = (name: String, level: Int, isShiny: Bool)
    @State private var pokemonName = ""
    @State private var pokemonLevel = 0
    @State private var isShiny = false

    var body: some View {
        VStack(spacing: 28) {
            Text("Wild\(pokemonName) appeared at level \(pokemonLevel)")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text(isShiny ? "It's a shiny Pokemon!" : "It's a normal Pokemon")
                .modifier(CustomLabel(foregroundColor: .black, size: 18))
        }
        .onAppear {
            let wildPokemon = encounterPokemon()
        }

    }

    private func encounterPokemon() -> PokemonEncounter {
        pokemonName = "Pikachu"
        pokemonLevel = Int.random(in: 1...50)
        isShiny = Bool.random()
        return (name: pokemonName, level: pokemonLevel, isShiny: isShiny)
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

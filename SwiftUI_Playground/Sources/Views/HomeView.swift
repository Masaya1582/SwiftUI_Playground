//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pikachu = Pokemon(id: 1, name: "Pikachu", type: "Electric")
    private let bulbasaur = Pokemon(id: 2, name: "Bulbasaur", type: "Grass/Poison")
    private let charmander = Pokemon(id: 3, name: "Charmander", type: "Fire")
    private let duplicatePikachu = Pokemon(id: 1, name: "Pikachu", type: "Electric") // Same as pikachu

    var body: some View {
        VStack {
            Text("Check Console for output")
                .onAppear {
                    var pokemonSet: Set<Pokemon> = []
                    pokemonSet.insert(pikachu)
                    pokemonSet.insert(bulbasaur)
                    pokemonSet.insert(charmander)
                    pokemonSet.insert(duplicatePikachu) // Trying to add a duplicate Pokemon

                    print("Number of unique Pokemon in the set: \(pokemonSet.count)")
                    for pokemon in pokemonSet {
                        print("Pokemon: \(pokemon.name), Type: \(pokemon.type)")
                    }
                }
        }
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

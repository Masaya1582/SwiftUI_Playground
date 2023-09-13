//
//  PokemonListView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var pokemonStore: PokemonStore

    var body: some View {
        NavigationView {
            List(pokemonStore.pokemons) { pokemon in
                VStack(alignment: .leading, spacing: 10) {
                    Text(pokemon.name)
                        .font(.headline)
                    Text("Type: \(pokemon.type)")
                    Text("Level: \(pokemon.level)")
                }
            }
            .navigationBarTitle("My Pokemon")
            .navigationBarItems(trailing: NavigationLink(destination: AddPokemonView()) {
                Image(systemName: "plus")
            })
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

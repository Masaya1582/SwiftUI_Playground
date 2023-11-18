//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let pokemonList: [Pokémon] = [Pikachu(), Charmander(), Squirtle(), Bulbasaur(), Charizard(), Jigglypuff(), Eevee(), Snorlax()]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(pokemonList, id: \.name) { pokemon in
                    PokémonListView(pokemon: pokemon)
                }
            }
        }
        .navigationBarTitle("Pokémon List")
    }
}

struct PokémonListView: View {
    let pokemon: Pokémon

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(pokemon.name)")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text("Type: \(pokemon.type)")
            Text("Level: \(pokemon.level)")
        }
        .frame(width: 240, height: 120)
        .border(Color.black)
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

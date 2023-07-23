//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pokemons = [
        Pokemon(name: "Bulbasaur", type: "Grass", ability: OvergrowAbility()),
        Pokemon(name: "Charmander", type: "Fire", ability: BlazeAbility()),
        Pokemon(name: "Pikachu", type: "Electric", ability: StaticAbility())
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        VStack {
            PokemonView(pokemon: Pokemons(name: "Pikachu", type: Pikachu(power: 100)))
                .padding()

            PokemonView(pokemon: Pokemons(name: "Bulbasaur", type: Bulbasaur(grassPower: 80)))
                .padding()

            PokemonView(pokemon: Pokemons(name: "Charmander", type: Charmander(firePower: 120)))
                .padding()
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

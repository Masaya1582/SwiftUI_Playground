//
//  DetailView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/23.
//

import SwiftUI

struct DetailView: View {
    let pokemon: Pokemon
    let delegate: PokemonSelectionDelegate?

    var body: some View {
        VStack {
            Text(pokemon.name)
                .font(.headline)
            Text(pokemon.type)
                .font(.subheadline)
                .foregroundColor(.gray)

            Button("Select Pokémon") {
                // Notify the delegate that a Pokémon was selected
                delegate?.didSelectPokemon(pokemon)
            }
            .padding()
        }
        .padding()
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(pokemon: <#Pokemon#>, delegate: <#PokemonSelectionDelegate?#>)
//    }
//}

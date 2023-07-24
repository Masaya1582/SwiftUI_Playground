//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            Button("Filter Fire Type Pokemons") {
                viewModel.filterFireTypePokemons()
            }
            List(viewModel.fireTypePokemons, id: \.name) { pokemon in
                Text("\(pokemon.name) - \(pokemon.type)")
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

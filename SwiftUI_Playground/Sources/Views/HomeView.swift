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
            Button("Zip Pokemons") {
                viewModel.zipPokemons()
            }
            List(viewModel.pairedPokemons, id: \.0.name) { pair in
                VStack(alignment: .leading) {
                    Text("\(pair.0.name) - \(pair.0.type)")
                    Text("\(pair.1.name) - \(pair.1.type)")
                }
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

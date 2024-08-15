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
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                HStack {
                    Text(pokemon.name.capitalized)
                        .modifier(CustomLabel(foregroundColor: .black, size: 20))
                }
            }
            .navigationTitle("Pokemon")
        }
        .onAppear {
            print("Pokemon array count on appear: \(viewModel.pokemons.count)")
        }
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

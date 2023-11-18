//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemon: Pokemon?
    private let apiManager = PokeAPIManager()

    var body: some View {
        VStack(spacing: 28) {
            if let pokemon = pokemon {
                Text("ID: \(pokemon.id)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
                Text("Pokemon Name: \(pokemon.name)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            } else {
                ProgressView()
            }
            Button("FetchPokemon") {
                fetchPokemon()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .onAppear {
            fetchPokemon()
        }
    }

    private func fetchPokemon() {
        let randomID = Int.random(in: 1...100)
        apiManager.fetchPokemon(withID: randomID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedPokemon):
                    pokemon = fetchedPokemon
                case .failure(let error):
                    print("Error fetching Pokemon: \(error)")
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

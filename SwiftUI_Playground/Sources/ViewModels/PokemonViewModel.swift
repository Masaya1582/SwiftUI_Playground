//
//  PokemonViewModel.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/03/04.
//  Copyright (c) 2024 ReNKCHANNEL. All rihgts reserved.
//

import Combine
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()

    func fetchPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }

            let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data)
            DispatchQueue.main.async {
                self.pokemons = pokemonList?.results ?? []
            }
        }.resume()
    }
}

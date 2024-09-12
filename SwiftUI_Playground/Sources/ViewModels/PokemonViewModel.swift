//
//  PokemonViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/19.
//

import SwiftUI

final class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var isLoading = false

    func fetchPokemon(id: Int) {
        isLoading = true
        APIClient.request(PokemonRequest(id: id)) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.pokemon = response
                    print("ポケモン情報: \(response)")
                case .failure(let error):
                    print("エラーだよ: \(error.localizedDescription)")
                }
            }
        }
    }
}

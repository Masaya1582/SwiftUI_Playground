// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

final class PokemonViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []

    func fetchPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let decodedResponse = try JSONDecoder().decode(PokemonResponse.self, from: data)
                self.fetchPokemonDetails(entries: decodedResponse.results)
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }

    private func fetchPokemonDetails(entries: [PokemonEntry]) {
        for entry in entries {
            URLSession.shared.dataTask(with: entry.url) { data, response, error in
                guard let data = data else { return }

                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    DispatchQueue.main.async {
                        self.pokemonList.append(pokemon)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }.resume()
        }
    }
}


//final class HomeViewModel: ObservableObject {
//    @Published var name = ""
//    @Published var halfModalText = ""
//    @Published var isFloatingViewVisible = false
//    @Published var isOpenImagePicker = false
//    @Published var isShowSourceTypeAlert = false
//    @Published var isShowHalfModalView = false
//    @Published var sourceType: UIImagePickerController.SourceType?
//    @Published var selectedImage: UIImage?
//    @Published var posts: [Post] = []
//
//    init() {
//        fetchPosts()
//    }
//
//    /// URLSessionとCombineを学ぶ
//    private func fetchPosts() {
//        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
//            URLSession.shared.dataTaskPublisher(for: url)
//                .map(\.data)
//                .decode(type: [Post].self, decoder: JSONDecoder())
//                .replaceError(with: [])
//                .receive(on: DispatchQueue.main)
//                .assign(to: &$posts)
//        }
//    }
//
//}

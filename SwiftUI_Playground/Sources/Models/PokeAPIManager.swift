//
//  PokeAPIManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/19.
//

import SwiftUI

//final class PokeAPIManager {
//    enum APIError: Error {
//        case invalidURL
//        case requestFailed
//    }
//    
//    func fetchPokemon(withID id: Int, completion: @escaping(Result<Pokemon, APIError>) -> Void) {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(.requestFailed))
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.requestFailed))
//                return
//            }
//
//            do {
//                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
//                completion(.success(pokemon))
//            } catch {
//                completion(.failure(.requestFailed))
//                print("Error decoding data: \(error.localizedDescription)")
//            }
//        }
//        task.resume()
//    }
//}

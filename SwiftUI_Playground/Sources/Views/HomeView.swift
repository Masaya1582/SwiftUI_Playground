//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum CatchError: Error {
    case noPokeBall
    case pokemonFled
    case pokemonNotFound
}
struct Pokemons {
    let name: String
}

struct HomeView: View {
    @State private var capturedPokemon: Pokemons?
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let pokemon = capturedPokemon {
                Text("You caught: \(pokemon.name)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .modifier(CustomLabel(foregroundColor: .red, size: 24))
            }
            Button("Catch Pokemon") {
                do {
                    self.capturedPokemon = try catchPokemon()
                } catch CatchError.noPokeBall {
                    self.errorMessage = "No Poke Ball Left"
                } catch CatchError.pokemonFled {
                    self.errorMessage = "Pokemon Fled, Try Again!"
                } catch {
                    self.errorMessage = "Unknown error occurred"
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
    }

    private func catchPokemon() throws -> Pokemons {
        let successProbability = Int.random(in: 1...10)

        if successProbability <= 5 {
            throw CatchError.noPokeBall
        } else if successProbability <= 8 {
            throw CatchError.pokemonFled
        } else {
            return Pokemons(name: "Pikachu")
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

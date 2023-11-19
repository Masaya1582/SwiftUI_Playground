//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum PokemoncaptureError: Error {
    case pokemonEscaped
    case pokeballFailed
}

struct HomeView: View {
    @State private var captureResult: String = ""

    var body: some View {
        VStack {
            Text("Pokemon Capture Simulator")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Button("CapturePokemon") {
                do {
                    try capturePokemon(success: Bool.random())
                    captureResult = "Congrats!\n You caught a Pokemon!"
                } catch PokemoncaptureError.pokemonEscaped {
                    captureResult = "Oh no! Pokemon escaped!"
                } catch {
                    captureResult = "Something went wrong while capturing the Pokemon"
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            Text(captureResult)
                .modifier(CustomLabel(foregroundColor: .red, size: 28))
        }

    }

    private func capturePokemon(success: Bool) throws {
        if success {
            print("Congratulations! You caught a Pokemon!")
        } else {
            throw PokemoncaptureError.pokemonEscaped
        }

    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.light)

}

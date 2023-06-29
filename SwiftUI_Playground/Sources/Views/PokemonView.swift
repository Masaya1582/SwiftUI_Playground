//
//  PokemonView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject private var viewModel = PokemonViewModel()

    var body: some View {
        List(viewModel.pokemon, id: \.self) { pokemon in
            pokemonDataList(pokemon)
        }
        .onAppear {
            viewModel.fetchPokemon()
        }
    }
}

@ViewBuilder
private func pokemonDataList(_ pokemon: Pokemon) -> some View {
    HStack {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 80, height: 80)
            AsyncImage(url: pokemon.imageUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown error")
                }
            }
        }
        VStack(alignment: .leading) {
            HStack {
                Text(pokemon.name)
                    .font(.system(size: 24, weight: .light))
                Spacer()
                Text(pokemon.types.joined(separator: ", "))
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.black.opacity(0.8))
            }
            Spacer().frame(height: 4)
            Text(pokemon.description)
                .foregroundColor(.gray.opacity(0.8))
                .font(.system(size: 12, weight: .light))
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}

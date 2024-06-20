//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct PokedexSample: Identifiable {
    let id: Int
    let name: String
    let type: String
    let imageName: String
}

extension PokedexSample {
    static let samplePokemons = [
        PokedexSample(id: 1, name: "Bulbasaur", type: "Grass", imageName: "bulbasaur"),
        PokedexSample(id: 2, name: "Charmander", type: "Fire", imageName: "charmander"),
        PokedexSample(id: 3, name: "Squirtle", type: "Water", imageName: "squirtle")
    ]
}

struct HomeView: View {
    let pokemons = PokedexSample.samplePokemons

    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon)
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokemonCell: View {
    var pokemon: PokedexSample

    var body: some View {
        HStack {
            Image(pokemon.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.all, 5)
                .background(Color(.systemGray6))
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                Text(pokemon.type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
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

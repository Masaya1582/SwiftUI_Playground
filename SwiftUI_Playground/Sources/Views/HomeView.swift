//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct PokemonCard: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let type: String
}

struct PokemonCardView: View {
    var pokemon: PokemonCard

    var body: some View {
        VStack {
            Image(pokemon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text(pokemon.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text(pokemon.type)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .frame(width: 200, height: 250)
        .background(Color.yellow)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct HomeView: View {
    private let samplePokemons = [
        PokemonCard(name: "Pikachu", imageName: "pikachu", type: "Electric"),
        PokemonCard(name: "Charmander", imageName: "charmander", type: "Fire"),
        PokemonCard(name: "Bulbasaur", imageName: "bulbasaur", type: "Grass"),
        PokemonCard(name: "Squirtle", imageName: "squirtle", type: "Water"),
        PokemonCard(name: "Eevee", imageName: "eevee", type: "Normal")
    ]

    var body: some View {
        VStack {
            Text("Pokémon Cards")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(samplePokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon)
                    }
                }
                .padding()
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

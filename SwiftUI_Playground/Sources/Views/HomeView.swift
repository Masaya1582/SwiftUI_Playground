//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemons: [Pokemon] = []

    var body: some View {
        VStack {
            ForEach(pokemons) { pokemon in
                HStack {
                    Image(uiImage: pokemon.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text("No: \(pokemon.id)")
                        Text(pokemon.name)
                        Text(pokemon.name)
                    }
                    Spacer()
                }
                Divider()
            }
        }
        .task {
            guard let pokemons = try? await fetchPokemons() else {
                return
            }
            await MainActor.run {
                self.pokemons = pokemons
            }
        }
    }

    private func fetchPokemons() async throws -> [Pokemon] {
        let host = "https://swiswiswift.com/2022-06-16"
        guard let url = URL(string: "\(host)/pokemons.json") else {
            fatalError("URL is not valid")
        }
        print(url)
        let (data, _) = try await URLSession.shared.data(from: url)
        let pokemonResponses = try JSONDecoder().decode([PokemonResponse].self, from: data)

        var pokemons: [Pokemon] = []
        for pokemonResponse in pokemonResponses {
            guard let imageUrl = URL(string: "\(host)/\(pokemonResponse.imageName)") else {
                fatalError("URL not found")
            }
            let (data, _) = try await URLSession.shared.data(from: imageUrl)
            guard let image = UIImage(data: data) else {
                fatalError("Image not found")
            }
            let pokemon = Pokemon(
                id: pokemonResponse.id,
                name: pokemonResponse.name,
                imageName: pokemonResponse.name,
                image: image)
            pokemons.append(pokemon)
        }
        return pokemons
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

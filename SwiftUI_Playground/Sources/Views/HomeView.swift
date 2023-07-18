//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PokemonViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Text(viewModel.name.isEmpty ? "Name" : "Name: \(viewModel.name)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Text(viewModel.type.isEmpty ? "Type" : "Type: \(viewModel.type)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Text(viewModel.ability.isEmpty ? "Ability" : "Ability: \(viewModel.ability)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Button {
                viewModel.decodePokemon()
            } label: {
                Text("Decode Pokemon")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
            }
        }
        .onAppear {
            viewModel.encodePokemon()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

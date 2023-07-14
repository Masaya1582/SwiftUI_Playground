//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String

    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

struct PokemonCell: View {
    let pokemon: Pokemon
    var body: some View {
        ZStack {
            Image(pokemon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                Spacer()
                Text(pokemon.name)
                    .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                    .frame(maxWidth: .infinity, maxHeight: 32)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .opacity(0.8)
            }
        }
    }
}

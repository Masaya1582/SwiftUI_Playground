//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let pokemon: [Pokemon] = [
        Pikachu(),
        Charmander(),
        Bulbasaur()
    ]

    var body: some View {
        VStack {
            ForEach(pokemon.indices, id: \.self) { index in
                VStack {
                    Text(pokemon[index].name)
                        .font(.title)
                        .padding(.bottom, 2)

                    Text("Type: \(pokemon[index].type)")
                        .font(.subheadline)
                        .padding(.bottom, 2)

                    Text(pokemon[index].attack())
                        .font(.headline)
                        .padding(.bottom, 20)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
        .padding()
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

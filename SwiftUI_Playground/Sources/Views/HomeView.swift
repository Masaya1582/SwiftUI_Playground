//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 28) {
            Text("Pokemon Attacks")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Text(FirePokemon(name: "Charmander").fireAttack())
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Text(WaterPokemon(name: "Squirtle").waterAttack())
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Text(GrassPokemon(name: "Bulbasaur").grassAttack())
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
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

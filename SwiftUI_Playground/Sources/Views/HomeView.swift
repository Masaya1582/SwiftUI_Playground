//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    typealias PokemonType = String
    @State private var attackResult = ""

    var body: some View {
        VStack {
            Text(attackResult)
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
        }
        .onAppear {
            let myPokemonType: PokemonType = "Electric"
            let opponentPokemonType: PokemonType = "Water"
            let effectiveness = attackEffectiveness(of: myPokemonType, against: opponentPokemonType)
            attackResult = effectiveness
        }
    }

    private func attackEffectiveness(of attackerType: PokemonType, against targetType: PokemonType) -> String {
        if attackerType == targetType {
            return "It's not very effective"
        } else {
            return "It's super effective!"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

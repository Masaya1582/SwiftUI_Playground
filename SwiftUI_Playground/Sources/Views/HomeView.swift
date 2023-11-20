//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var battleResult = ""
    @State private var isBattleInProgress = false

    var body: some View {
        VStack(spacing: 28) {
            if isBattleInProgress {
                ProgressView()
            } else {
                Text("Pokemon Battle")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
                Text(battleResult)
                    .modifier(CustomLabel(foregroundColor: .red, size: 16))
            }
            Button("Start Battle") {
                startBattle()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }

    }

    private func startBattle() {
        isBattleInProgress = true
        battleResult = "Engaging Opponent..."

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isBattleInProgress = false
            battleResult = "Victory! You defeated the opponent!"

            defer {
                battleResult += "\nPokemon healed!"
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.light)

}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var playerPokemonHP = 100
    @State private var opponentPokemonHP = 100
    @State private var battleLog = ""

    var body: some View {
        VStack(spacing: 28) {
            Text("Pokemon Battle")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))

            Text("Player's PokemonHP: \(playerPokemonHP)")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text("Opponent's PokemonHP: \(opponentPokemonHP)")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            Button("Start Battle") {
                startBattle()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

            ScrollView {
                Text(battleLog)
                    .modifier(CustomLabel(foregroundColor: .black, size: 16))
            }
            .frame(height: 400)
        }
    }

    private func startBattle() {
        battleLog = ""
        repeat {
            let playerDamage = Int.random(in: 10...50)
            opponentPokemonHP -= playerDamage
            logBattle("Player's Pokemon attacks and deals \(playerDamage) damage!")

            if opponentPokemonHP <= 0 {
                logBattle("Oppenent's Pokemon fainted, You win!")
                break
            }

            let opponentDamage = Int.random(in: 10...50)
            playerPokemonHP -= opponentDamage
            logBattle("Opponent's Pokemon attacks and deals \(opponentDamage) damage!")

            if playerPokemonHP <= 0 {
                logBattle("Player's Pokemon fainted. You lose!")
                break
            }
        } while playerPokemonHP > 0 && opponentPokemonHP > 0
    }

    private func logBattle(_ text: String) {
        battleLog += "\(text)\n--------------------------------------------\n"
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

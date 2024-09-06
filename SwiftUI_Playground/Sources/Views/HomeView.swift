//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var appChoice = ["Rock", "Paper", "Scissors"].randomElement()!
    @State private var userScore = 0
    @State private var appScore = 0
    @State private var resultMessage = ""
    @State private var showResult = false

    private let choices = ["Rock", "Paper", "Scissors"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
                .bold()

            Spacer()

            Text("App's Choice: \(appChoice)")
                .font(.headline)

            HStack {
                ForEach(choices, id: \.self) { choice in
                    Button(action: {
                        playGame(userChoice: choice)
                    }) {
                        Text(choice)
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }

            Spacer()

            Text("Your Score: \(userScore)")
            Text("App's Score: \(appScore)")

            Spacer()

            if showResult {
                Text(resultMessage)
                    .font(.title)
                    .bold()
                    .foregroundColor(resultMessage.contains("win") ? .green : .red)
            }

            Button(action: resetGame) {
                Text("Reset Game")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    // Game Logic
    private func playGame(userChoice: String) {
        let appChoice = choices.randomElement()!
        self.appChoice = appChoice

        if userChoice == appChoice {
            resultMessage = "It's a tie!"
        } else if (userChoice == "Rock" && appChoice == "Scissors") ||
                    (userChoice == "Scissors" && appChoice == "Paper") ||
                    (userChoice == "Paper" && appChoice == "Rock") {
            resultMessage = "You win!"
            userScore += 1
        } else {
            resultMessage = "You lose!"
            appScore += 1
        }

        showResult = true
    }

    private func resetGame() {
        userScore = 0
        appScore = 0
        resultMessage = ""
        showResult = false
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

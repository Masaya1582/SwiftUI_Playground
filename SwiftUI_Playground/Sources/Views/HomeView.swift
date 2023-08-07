//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    private let questions = [
        Question(text: "What is the capital of France?", answers: ["Paris", "Berlin", "Madrid", "Rome"], correctAnswerIndex: 0),
        Question(text: "Which planet is known as the Red Planet?", answers: ["Venus", "Mars", "Jupiter", "Neptune"], correctAnswerIndex: 1)
        // Add more questions
    ]

    var body: some View {
        VStack {
            Text("Trivia Quiz Game")
                .font(.largeTitle)
                .padding()

            Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 16))
                .padding()

            Text(questions[currentQuestionIndex].text)
                .font(.custom(FontFamily.Caprasimo.regular, size: 18))
                .padding()

            Spacer()

            VStack(spacing: 20) {
                ForEach(0..<questions[currentQuestionIndex].answers.count, id: \.self) { index in
                    Button(action: {
                        checkAnswer(selectedIndex: index)
                    }) {
                        Text(questions[currentQuestionIndex].answers[index])
                    }
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
                }
            }
            Spacer()
            Text("Score: \(score)")
                .font(.title)
                .padding()
        }
        .padding()
    }

    func checkAnswer(selectedIndex: Int) {
        if selectedIndex == questions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // Show quiz completion message or navigate to another screen
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var diceNumber1 = 1
    @State private var diceNumber2 = 1
    @State private var isRolling = false

    var body: some View {
        VStack(spacing: 50) {
            HStack {
                DiceView(number: diceNumber1)
                DiceView(number: diceNumber2)
            }
            .padding()

            Button(action: rollDice) {
                Text("Roll Dice")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            }
            .disabled(isRolling)
        }
        .padding()
    }

    private func rollDice() {
        isRolling = true

        withAnimation(.easeInOut(duration: 1)) {
            diceNumber1 = Int.random(in: 1...6)
            diceNumber2 = Int.random(in: 1...6)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isRolling = false
        }
    }
}

struct DiceView: View {
    let number: Int

    var body: some View {
        Image(systemName: "die.face.\(number).fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var diceValue = 1

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(diceValue)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Spacer()
            Button("Roll") {
                rollDice()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))
            Spacer()
        }
        .navigationTitle("Dice Roller")
    }

    private func rollDice() {
        diceValue = Int.random(in: 1...6)
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

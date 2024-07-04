//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let diceNumbers = 1...6

    var body: some View {
        VStack {
            Text("Hello World")
        }
        .onAppear {
            let rolledNumber = Int.random(in: diceNumbers)
            print("Dice: \(rolledNumber)")
        }
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

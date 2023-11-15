//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {

    var body: some View {
        Text("Check Console for output")
            .onAppear {
                // Creating different global dispatch queues representing different environments
                let sunnyFieldQueue = DispatchQueue.global(qos: .default)
                let rainyForestQueue = DispatchQueue.global(qos: .background)
                let snowyMountainQueue = DispatchQueue.global(qos: .userInitiated)

                // Sending tasks to catch Pokemon in their respective environments asynchronously
                sunnyFieldQueue.async {
                    catchPokemon(name: "Pikachu", environment: "Sunny Field")
                }
                rainyForestQueue.async {
                    catchPokemon(name: "Bulbasaur", environment: "Rainy Field")
                }
                snowyMountainQueue.async {
                    catchPokemon(name: "Squirtle", environment: "Snowy Mountain")
                }
            }
    }

    private func catchPokemon(name: String, environment: String) {
        print("Trainer caught \(name) in the \(environment)")
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

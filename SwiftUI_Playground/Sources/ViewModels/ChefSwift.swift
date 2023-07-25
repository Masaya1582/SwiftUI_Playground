// 
//  ChefCombine.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class ChefSwift: ObservableObject {
    @Published var cake: Cake?
    @Published var error: String?
    @Published var isBaking = false

    func startBaking() {
        isBaking = true
        error = nil
        // Simulate baking a cake with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if Bool.random() {
                // 50% chance of success
                self?.cake = Cake(flavor: "Chocolate")
            } else {
                // 50% chance of failure
                self?.error = "Oven temperature too high!"
            }
            self?.isBaking = false
        }
    }
}

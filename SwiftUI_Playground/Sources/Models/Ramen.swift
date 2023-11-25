//
//  Ramen.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/25.
//

import Foundation

struct Ramen {
    let name: String
    let description: String
    let image: String
    let isSpicy: Bool
    let price: Int

    init(name: String, description: String, image: String, isSpicy: Bool, price: Int) {
        self.name = name
        self.description = description
        self.image = image
        self.isSpicy = isSpicy
        self.price = price
    }
}

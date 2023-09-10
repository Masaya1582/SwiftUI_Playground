//
//  Card.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let color: Color

    static let allCards: [Card] = [
        Card(color: .red),
        Card(color: .blue),
        Card(color: .green),
        Card(color: .orange),
        Card(color: .purple)
    ]
}

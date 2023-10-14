//
//  Card.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let color: Color
    var offset: CGFloat
}

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

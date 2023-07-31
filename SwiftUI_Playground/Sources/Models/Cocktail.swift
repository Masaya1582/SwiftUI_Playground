//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Cocktail: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: Data? // Change this to Data type
}

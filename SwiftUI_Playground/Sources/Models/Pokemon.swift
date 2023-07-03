//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Pokemon: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var image: UIImage
}

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    let imageName: String
}

//
//  Joke.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Joke: Codable {
    let category: String
    let joke: String

    // Not Necessary
    enum CodingKeys: String, CodingKey {
        case category
        case joke
    }
}

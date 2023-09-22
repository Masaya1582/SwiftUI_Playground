//
//  Joke.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Joke: Codable, Hashable {
    let setup: String
    let punchline: String

    init(setup: String, punchline: String) {
        self.setup = setup
        self.punchline = punchline
    }
}

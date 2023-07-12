//
//  Joke.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Joke: Codable {
    let setup: String
    let punchline: String

    init(setup: String, punchline: String) {
        self.setup = setup
        self.punchline = punchline
    }
}

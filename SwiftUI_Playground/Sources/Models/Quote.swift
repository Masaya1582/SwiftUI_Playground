//
//  Quote.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Quote: Codable {
    let content: String
    let author: String

    init(content: String, author: String) {
        self.content = content
        self.author = author
    }
}

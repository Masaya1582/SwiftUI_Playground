//
//  Note.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Note: Codable {
    let title: String
    let content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

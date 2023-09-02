//
//  User.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var username: String

    init(id: Int, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}

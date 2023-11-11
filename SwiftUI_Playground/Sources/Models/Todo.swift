//
//  Todo.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Todo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

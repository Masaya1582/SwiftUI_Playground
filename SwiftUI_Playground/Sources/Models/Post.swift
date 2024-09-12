//
//  Post.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/12.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: String
    var imageUrl: String
    var userName: String
    var message: String?
}

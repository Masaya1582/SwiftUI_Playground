//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

final class HomeModel {
    var name: String
    var age: Int
    var height: Double
    var isMan: Bool

    init(name: String, age: Int, height: Double, isMen: Bool) {
        self.name = name
        self.age = age
        self.height = height
        self.isMan = isMen
    }
}

struct Post: Identifiable {
    var id = UUID()
    var username: String
    var profileImage: String
    var postImage: String
    var caption: String
    var timeAgo: String
}

struct Pokemon: Codable {
    let id: Int
    let name: String
}

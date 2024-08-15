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

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String

    private enum CodingKeys: CodingKey {
        case id
        case userId
        case title
        case body
    }
}

struct Pokemon: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "url"
    }
}

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}

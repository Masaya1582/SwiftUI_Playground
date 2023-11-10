//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

class HomeModel {
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
}

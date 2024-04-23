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
}

struct Pokemon: Codable {
    let id: Int
    let name: String
}

final class MemoManager: ObservableObject {
    @Published var memos: [Memo] = []

    func addMemo(content: String) {
        let newMemo = Memo(content: content)
        memos.append(newMemo)
        saveMemos()
    }

    func saveMemos() {
        // Here you would implement saving to a file or a database
    }

    func loadMemos() {
        // Here you would implement loading from a file or a database
    }
}


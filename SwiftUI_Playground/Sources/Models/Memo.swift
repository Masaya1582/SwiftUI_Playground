//
//  Memo.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Memo: Identifiable, Codable {
    var id = UUID()
    var content: String
}

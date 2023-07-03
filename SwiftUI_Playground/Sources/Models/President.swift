//
//  President.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct President: Identifiable {
    var id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

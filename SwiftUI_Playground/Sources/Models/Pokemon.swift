//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/15.
//

import Foundation

final class Pokemon {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) was born!")
    }

    deinit {
        print("\(name) went back to the wild!")
    }
}

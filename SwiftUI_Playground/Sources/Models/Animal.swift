//
//  Animal.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Animal {
    let name: String
    let description: String
    let imageName: String
}

// Create some sample animals
extension Animal {
    static let lion = Animal(name: "Lion", description: "The king of the jungle", imageName: "lion")
    static let elephant = Animal(name: "Elephant", description: "A big and gentle animal", imageName: "elephant")
    static let giraffe = Animal(name: "Giraffe", description: "Has a long neck", imageName: "giraffe")
    static let allAnimals = [lion, elephant, giraffe]
}

//
//  Repository.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Repository: Decodable {
    let name: String
    let description: String?

    init(name: String, description: String?) {
        self.name = name
        self.description = description
    }
}

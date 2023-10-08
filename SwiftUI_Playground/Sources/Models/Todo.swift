//
//  Todo.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Todo: Decodable, Identifiable {
    let id: Int
    let title: String
}

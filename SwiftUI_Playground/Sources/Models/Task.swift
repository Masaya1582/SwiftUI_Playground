//
//  Task.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
}

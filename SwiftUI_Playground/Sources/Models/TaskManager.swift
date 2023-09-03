//
//  TaskManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/03.
//

import SwiftUI

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
}

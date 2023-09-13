//
//  TaskEnum.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/09/13.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

enum TaskPriority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

enum TaskStatus: String, CaseIterable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case completed = "Completed"
}

//
//  Reminder.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    let title: String
    let date: Date

    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}

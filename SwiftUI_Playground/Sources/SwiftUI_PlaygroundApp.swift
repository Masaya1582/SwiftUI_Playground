//
//  SwiftUI_PlaygroundApp.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

@main
struct SwiftUI_PlaygroundApp: App {
    @StateObject var taskManager = TaskManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(taskManager)
        }
    }
}

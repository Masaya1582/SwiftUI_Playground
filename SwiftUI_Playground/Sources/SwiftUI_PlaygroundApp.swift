//
//  SwiftUI_PlaygroundApp.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

@main
struct SwiftUI_PlaygroundApp: App {
    @State static var presentSideMenu = false
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

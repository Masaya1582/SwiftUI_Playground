//
//  SceneDelegate.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/08/05.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: HomeView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

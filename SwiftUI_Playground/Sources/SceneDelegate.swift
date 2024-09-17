//
//  SceneDelegate.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "com.run.button" {
            print("Workoutを開始します")
        }
        completionHandler(true)
    }
}

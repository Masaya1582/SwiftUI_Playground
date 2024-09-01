//
//  SwiftUI_PlaygroundApp.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

@main
struct SwiftUI_PlaygroundApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let sampleRecipe = Recipe(
                imageName: "img_pancakes",
                title: "Delicious Pancakes",
                description: "Fluffy and light pancakes perfect for breakfast.",
                ingredients: [
                    "2 cups flour",
                    "2 tablespoons sugar",
                    "1 tablespoon baking powder",
                    "1/2 teaspoon salt",
                    "2 eggs",
                    "1 1/2 cups milk",
                    "1/4 cup melted butter"
                ],
                instructions: [
                    "In a large bowl, mix together the flour, sugar, baking powder, and salt.",
                    "In another bowl, beat the eggs and then whisk in the milk and melted butter.",
                    "Pour the wet ingredients into the dry ingredients and stir until just combined.",
                    "Heat a lightly oiled griddle or frying pan over medium high heat.",
                    "Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.",
                    "Brown on both sides and serve hot."
                ],
                notes: "Add a splash of vanilla extract for extra flavor."
            )

            HomeView(recipe: sampleRecipe)
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return true
    }
}

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "com.run.button" {
            print("Workoutを開始します")
        }
        completionHandler(true)
    }
}

//
//  SwiftUI_PlaygroundApp.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

@main
struct SwiftUI_PlaygroundApp: App {
    @State private var palettes: [ColorPalette] = []

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(palettes: $palettes)
                    .navigationBarTitle("Color Palettes")
                    .navigationBarItems(
                        trailing: NavigationLink("Add Palette", destination: AddPaletteView(palettes: $palettes))
                    )
            }
        }
    }
}

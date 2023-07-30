//
//  DisplaySettingsPage.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/30.
//

import SwiftUI

struct DisplaySettingsPage: View {
    @State private var brightness: Double = 50.0
    @State private var selectedWallpaper = "Sunset"
    let wallpapers = ["Sunset", "Mountain", "Cityscape", "Beach"]

    var body: some View {
        Form {
            Section(header: Text("Brightness")) {
                Slider(value: $brightness, in: 0...100, step: 1)
                    .padding(.horizontal)
            }

            Section(header: Text("Wallpaper")) {
                Picker("Select Wallpaper", selection: $selectedWallpaper) {
                    ForEach(wallpapers, id: \.self) { wallpaper in
                        Text(wallpaper)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Display Settings")
    }
}

struct DisplaySettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        DisplaySettingsPage()
    }
}

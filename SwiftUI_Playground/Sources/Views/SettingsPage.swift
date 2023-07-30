//
//  SettingsPage.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/30.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        List {
            Section(header: Text("Wi-Fi")) {
                Toggle("Wi-Fi", isOn: .constant(true))
                Text("Wi-Fi Network: MyNetwork")
            }

            Section(header: Text("Bluetooth")) {
                Toggle("Bluetooth", isOn: .constant(false))
                Text("Devices: None")
            }

            Section(header: Text("Display")) {
                NavigationLink(destination: DisplaySettingsPage()) {
                    Text("Brightness & Wallpaper")
                }
                Text("Auto-lock: 1 Minute")
                Text("Wallpaper: Sunset")
            }
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

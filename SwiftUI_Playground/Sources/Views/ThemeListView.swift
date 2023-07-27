//
//  ThemeListView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ThemeListView: View {
    @EnvironmentObject var themeSettings: ThemeSettings

    var body: some View {
        VStack {
            Text("Select a Color Theme:")
                .font(.headline)
                .padding()
            List {
                Button(action: { themeSettings.themeColor = .red }) {
                    Text("Red")
                }
                Button(action: { themeSettings.themeColor = .blue }) {
                    Text("Blue")
                }
                Button(action: { themeSettings.themeColor = .green }) {
                    Text("Green")
                }
            }
        }
    }
}

struct ThemeListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeListView()
    }
}

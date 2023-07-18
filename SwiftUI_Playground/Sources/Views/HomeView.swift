//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTheme = "Dark"
    private let themes = ["Dark", "Light", "Automatic"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // デフォルト
                    Picker("Appearance", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) {
                            Text($0)
                        }
                    }
                }

                // インラインスタイル
                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.inline)


                // Wheel style
                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)

                // Segmentedスタイル
                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .pickerStyle(.navigationLink)
            }
            .navigationTitle("Display & Brightness")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

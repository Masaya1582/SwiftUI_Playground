//
//  CustomHalfView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/18.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct CustomHalfView: View {
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

struct CustomHalfView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHalfView()
    }
}

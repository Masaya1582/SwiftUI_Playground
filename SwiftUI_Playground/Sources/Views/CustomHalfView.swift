//
//  CustomHalfView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/18.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct CustomHalfView: View {
    @State private var selectedTheme = "book"
    private let themes = ["book", "eyeglasses", "timer"]

    var body: some View {
        NavigationStack {
            Form {
                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) { themes in
                        Image(systemName: themes)
                    }
                }
                .pickerStyle(.segmented)
                .pickerStyle(.navigationLink)
                switch selectedTheme {
                case "book":
                    Text("Book View")
                        .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                case "eyeglasses":
                    Text("Eyeglasses View")
                        .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                case "timer":
                    Text("Timer View")
                        .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                default:
                    EmptyView()
                }
            }
            .navigationTitle("This is Half-ModalView")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomHalfView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHalfView()
    }
}

//
//  ColorPaletteDetailView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/09/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ColorPaletteDetailView: View {
    let palette: ColorPalette

    var body: some View {
        ScrollView {
            VStack {
                ForEach(palette.colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: 100)
                }
            }
        }
        .navigationBarTitle(palette.name)
    }
}

struct ColorPaletteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePalette = ColorPalette(name: "Sample Palette", colors: [.red, .green, .blue])

        return NavigationView {
            ColorPaletteDetailView(palette: samplePalette)
                .navigationBarTitle(samplePalette.name)
        }
    }
}

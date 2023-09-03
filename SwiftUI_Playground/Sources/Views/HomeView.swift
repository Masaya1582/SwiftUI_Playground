//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @Binding var palettes: [ColorPalette]

    var body: some View {
        List(palettes) { palette in
            NavigationLink(destination: ColorPaletteDetailView(palette: palette)) {
                Text(palette.name)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var samplePalettes: [ColorPalette] = [
        ColorPalette(name: "Palette 1", colors: [.red, .green, .blue]),
        ColorPalette(name: "Palette 2", colors: [.orange, .purple, .pink]),
        ColorPalette(name: "Palette 3", colors: [.red, .green, .blue]),
        ColorPalette(name: "Palette 4", colors: [.orange, .purple, .pink])
    ]
    static var previews: some View {
        HomeView(palettes: .constant(samplePalettes))
    }
}

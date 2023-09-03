//
//  AddPaletteView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/09/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AddPaletteView: View {
    @Binding var palettes: [ColorPalette]
    @State private var paletteName = ""
    @State private var selectedColor = Color.red
    @State private var colors: [Color] = []

    var body: some View {
        Form {
            Section(header: Text("Palette Name")) {
                TextField("Enter name", text: $paletteName)
            }

            Section(header: Text("Add Colors")) {
                ColorPicker("Select a color", selection: $selectedColor)
                Button(action: {
                    colors.append(selectedColor)
                }) {
                    Text("Add Color")
                }
            }

            Section(header: Text("Palette Preview")) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: 50)
                }
            }

            Section {
                Button(action: {
                    if !paletteName.isEmpty && !colors.isEmpty {
                        let newPalette = ColorPalette(name: paletteName, colors: colors)
                        palettes.append(newPalette)
                        paletteName = ""
                        colors.removeAll()
                    }
                }) {
                    Text("Save Palette")
                }
            }
        }
        .navigationBarTitle("Add Palette")
    }
}

struct AddPaletteView_Previews: PreviewProvider {
    @State static var samplePalettes: [ColorPalette] = [
        ColorPalette(name: "", colors: [.red, .green, .blue])
    ]
    static var previews: some View {
        AddPaletteView(palettes: .constant(samplePalettes))
    }
}

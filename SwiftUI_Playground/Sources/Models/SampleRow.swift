//
//  SampleRow.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
    }

    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

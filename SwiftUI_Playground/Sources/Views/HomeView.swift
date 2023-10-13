//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isOptionSelected = false

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            ForEach(1...10, id: \.self) { index in
                RadioButtonView(isSelected: $isOptionSelected)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

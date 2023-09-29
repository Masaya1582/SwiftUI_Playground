//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var percent: Double = 0
    @State private var trumpText = L10n.trumpTranscript

    var body: some View {
        VStack {
            TextScrollView(text: trumpText + trumpText + trumpText + trumpText, percent: $percent)
                .modifier(CustomLabel(foregroundColor: .black, size: 16))
            Slider(value: $percent, in: 0...100)
                .padding(.horizontal)
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

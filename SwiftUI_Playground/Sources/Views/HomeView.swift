//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let touchTypes: [UIImpactFeedbackGenerator.FeedbackStyle] = [.light, .medium, .heavy, .soft, .rigid]
    private let buttonLabels = ["Light Touch", "Medium Touch", "Heavy Touch", "Soft Touch", "Rigid Touch"]

    var body: some View {
        VStack(spacing: 40) {
            ForEach(0..<touchTypes.count, id: \.self) { index in
                Button {
                    let generator = UIImpactFeedbackGenerator(style: touchTypes[index])
                    generator.impactOccurred()
                } label: {
                    Text(buttonLabels[index])
                        .font(.custom(FontFamily.Caprasimo.regular, size: 42))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

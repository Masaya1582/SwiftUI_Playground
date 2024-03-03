//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isAnimating = false

    var body: some View {
        // Square View
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundColor(isAnimating ? .blue : .red)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(.linear(duration: 1), value: isAnimating)
            .onTapGesture {
                // Toggle the animation state
                isAnimating.toggle()
            }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

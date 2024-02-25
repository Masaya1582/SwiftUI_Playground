//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false

    var body: some View {
        Circle()
            .fill(isAnimating ? Color.blue : Color.red) // Change color
            .frame(width: isAnimating ? 100 : 50, height: isAnimating ? 100 : 50) // Change size
            .position(x: isAnimating ? 300 : 100, y: isAnimating ? 600 : 100) // Change position
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isAnimating.toggle()
                }
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

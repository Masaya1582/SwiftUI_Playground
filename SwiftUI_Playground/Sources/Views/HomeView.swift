//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var rotation: Double = 0
    @State private var color: Color = .blue
    @State private var pathOffset = CGSize.zero

    var body: some View {
        VStack {
            Spacer()

            // Animated Block
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .rotationEffect(.degrees(rotation))
                .offset(pathOffset)
                .animation(.easeInOut(duration: 1), value: rotation)
                .animation(.easeInOut(duration: 1.5).delay(0.5), value: pathOffset)
                .animation(.easeInOut(duration: 2), value: color)

            Spacer()

            // Trigger Button
            Button("Animate") {
                isAnimating.toggle()
                if isAnimating {
                    // Define the animation sequence
                    rotation = 360
                    color = .red
                    pathOffset = CGSize(width: 150, height: -200)
                } else {
                    // Reset to initial state
                    rotation = 0
                    color = .blue
                    pathOffset = CGSize.zero
                }
            }
            .padding()
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

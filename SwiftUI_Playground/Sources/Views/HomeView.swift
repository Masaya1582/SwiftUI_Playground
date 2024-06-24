//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)

            // Rotating Circle
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
                .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 0, y: 10)
                .rotationEffect(.degrees(rotationAngle))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear {
                    self.rotationAngle = 360
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

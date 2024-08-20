//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var animateClouds = false
    @State private var animateRain = false

    var body: some View {
        ZStack {
            // Background sky
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            // Sun
            Circle()
                .fill(Color.yellow)
                .frame(width: 120, height: 120)
                .offset(x: -100, y: -200)
                .blur(radius: 10)

            // Moving clouds
            Group {
                CloudView()
                    .offset(x: animateClouds ? 300 : -300, y: -150)
                    .animation(.linear(duration: 8).repeatForever(autoreverses: true), value: animateClouds)

                CloudView()
                    .offset(x: animateClouds ? -300 : 300, y: -100)
                    .animation(.linear(duration: 10).repeatForever(autoreverses: true), value: animateClouds)

                CloudView()
                    .offset(x: animateClouds ? 350 : -350, y: -200)
                    .animation(.linear(duration: 7).repeatForever(autoreverses: true), value: animateClouds)
            }

            // Falling rain
            ForEach(0..<20) { i in
                RainDrop()
                    .offset(x: CGFloat.random(in: -150...150), y: animateRain ? 300 : -300)
                    .animation(
                        Animation.linear(duration: Double.random(in: 1.5...2.5))
                            .repeatForever(autoreverses: false)
                            .delay(Double(i) * 0.1), value: animateRain
                    )
            }
        }
        .onAppear {
            animateClouds = true
            animateRain = true
        }
    }
}

// Cloud view
struct CloudView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.8))
                .frame(width: 200, height: 80)

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.8))
                .frame(width: 150, height: 60)
                .offset(x: -60, y: 30)

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.8))
                .frame(width: 100, height: 50)
                .offset(x: 60, y: 30)
        }
        .blur(radius: 3)
    }
}

// Rain drop view
struct RainDrop: View {
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(width: 2, height: 15)
            .opacity(0.5)
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

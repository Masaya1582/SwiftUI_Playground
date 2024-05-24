//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct AchievementBadge: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
                .scaleEffect(animate ? 1.0 : 0.5)
                .opacity(animate ? 1.0 : 0.0)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(Animation.easeInOut(duration: 1.5).repeatCount(1, autoreverses: false), value: animate)

            Text("🏆")
                .font(.system(size: 100))
                .scaleEffect(animate ? 1.0 : 0.5)
                .opacity(animate ? 1.0 : 0.0)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(Animation.easeInOut(duration: 1.5).repeatCount(1, autoreverses: false), value: animate)
        }
        .onAppear {
            self.animate = true
        }
    }
}

struct HomeView: View {
    
    var body: some View {
        VStack {
            Spacer()
            AchievementBadge()
            Spacer()
            Text("Achievement Unlocked!")
                .font(.largeTitle)
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

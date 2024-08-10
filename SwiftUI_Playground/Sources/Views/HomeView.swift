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
        ZStack {
            ForEach(0..<8) { index in
                Circle()
                    .fill(Color.white)
                    .frame(width: 10, height: 10)
                    .offset(y: -30)
                    .rotationEffect(.degrees(Double(index) * 45))
                    .opacity(isAnimating ? 0.2 : 1)
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.1), value: isAnimating)
            }

            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .orange, .red, .purple, .blue]), center: .center), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(Animation.linear(duration:
                                            1).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear
            {
                isAnimating = true
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

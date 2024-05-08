//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // MARK: - Properties
    @State private var isAnimating = false

    // MARK: - Body
    var body: some View {
        ZStack {
            ForEach(0..<8) { index in
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue.opacity(0.75))
                    .scaleEffect(0.8)
                    .offset(y: -40)
                    .rotationEffect(.degrees(Double(index) / 8 * 360))
                    .frame(width: 100, height: 100)
                    .blur(radius: 1)
                    .opacity(isAnimating ? 1.0 : 0.2)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(
                        Animation
                            .timingCurve(0.5, 1, 0.5, 1, duration: 1.5)
                            .repeatForever(autoreverses: false)
                            .delay(0.125 * Double(index))
                        , value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
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

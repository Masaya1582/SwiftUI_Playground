//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var circleCount = 16
    private let circleColor: [Color] = [.orange, .green, .red, .blue, .brown, .purple, .pink, .indigo, .mint]

    var body: some View {
        RadialLayout {
            ForEach(0..<circleCount, id: \.self) { _ in
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(circleColor.randomElement() ?? .orange)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Stepper("Circle Count: \(circleCount)", value: $circleCount.animation(), in: 0...36)
                .padding()
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

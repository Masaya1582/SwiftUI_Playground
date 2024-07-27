//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isSpinning = false

    var body: some View {
        ZStack {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(index % 2 == 0 ? .blue : .red)
                    .offset(y: isSpinning ? -30 : -20)
                    .rotationEffect(.degrees(isSpinning ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false).delay(Double(index) * 0.2), value: isSpinning)
            }
        }
        .onAppear {
            isSpinning = true
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

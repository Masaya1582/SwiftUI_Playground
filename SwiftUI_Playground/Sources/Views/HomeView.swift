//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var timerValue = 10
    @State private var isBombExploded = false

    var body: some View {
        VStack {
            Text("Time: \(timerValue)")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            if isBombExploded {
                BombAnimationView()
            }
            Spacer()
            Button("Start Countdown") {
                startTimer()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .animation(.default)
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timerValue > 0 {
                timerValue -= 1
            } else {
                timer.invalidate()
                isBombExploded = true
            }
        }
    }
}

struct BombAnimationView: View {
    @State private var rotation = 0.0

    var body: some View {
        Image(systemName: "flame.fill")
            .font(.system(size: 100))
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever()) {
                    rotation = 360
                }
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

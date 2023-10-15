//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var sunPosition: CGPoint = CGPoint(x: 50, y: 150)
    @State private var isSunRising = false

    var body: some View {
        ZStack {
            // Background sky
            LinearGradient(
                gradient: Gradient(colors: [.blue, .yellow]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // Sun
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.yellow)
                .offset(x: sunPosition.x, y: sunPosition.y)

            // Cloud
            CloudView()
                .offset(x: -80, y: 20)
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                isSunRising.toggle()
            }
        }
        .onChange(of: isSunRising) { newValue in
            if newValue {
                sunPosition = CGPoint(x: 50, y: 150)
            } else {
                sunPosition = CGPoint(x: 50, y: 350)
            }
        }
    }
}

struct CloudView: View {
    var body: some View {
        Image(systemName: "cloud.fill")
            .resizable()
            .frame(width: 200, height: 100)
            .foregroundColor(.white)
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

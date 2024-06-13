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
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("We'll be back soon!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Text("We are currently performing scheduled maintenance.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "wrench.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                Spacer()
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct AchievementPopupView: View {
    var title: String
    var message: String
    var imageName: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(message)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct HomeView: View {
    @State private var showPopup = false

    var body: some View {
        ZStack {
            // Main content
            VStack {
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        self.showPopup.toggle()
                    }
                }) {
                    Text("Show Achievement")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }

            // Achievement Popup
            if showPopup {
                AchievementPopupView(title: "Achievement Unlocked!", message: "You've completed the tutorial.", imageName: "star.fill")
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.showPopup.toggle()
                        }
                    }
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showPopup = false

    var body: some View {
        ZStack {
            // Your main content view
            VStack {
                Button(action: {
                    // This toggles the pop-up's visibility
                    withAnimation {
                        showPopup.toggle()
                    }
                }) {
                    Text("Tap Me")
                }
            }

            // Conditionally display the pop-up view
            if showPopup {
                // The pop-up view itself
                PopupView()
                    .transition(.move(edge: .bottom)) // This adds a sliding animation from the bottom
                    .zIndex(1) // Ensures the pop-up is above other content
            }
        }
    }
}

struct PopupView: View {
    var body: some View {
        VStack {
            Text("Hello, Pop-up!")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
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

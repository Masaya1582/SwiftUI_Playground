//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        DownloadSuccessfulView()
    }
}

struct DownloadSuccessfulView: View {
    @State private var isCheckmarkVisible = false
    @State private var isTextVisible = false
    @State private var isButtonVisible = false

    var body: some View {
        VStack {
            Spacer()

            // Checkmark Icon
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .scaleEffect(isCheckmarkVisible ? 1 : 0)
                .opacity(isCheckmarkVisible ? 1 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6).delay(0.2), value: isCheckmarkVisible)

            // Success Message
            Text("Download Successful!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .opacity(isTextVisible ? 1 : 0)
                .offset(y: isTextVisible ? 0 : 20)
                .animation(.easeInOut(duration: 0.6).delay(0.5), value: isTextVisible)

            Spacer()

            // Continue Button
            Button(action: {
                // Action for the button
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(radius: 10)
            }
            .scaleEffect(isButtonVisible ? 1 : 0)
            .opacity(isButtonVisible ? 1 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.6).delay(0.7), value: isButtonVisible)

            Spacer()
        }
        .onAppear {
            withAnimation {
                isCheckmarkVisible = true
                isTextVisible = true
                isButtonVisible = true
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

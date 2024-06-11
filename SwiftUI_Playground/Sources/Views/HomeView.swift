//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct EmergencyAlertView: View {
    var title: String
    var message: String
    var onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(message)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: {
                onDismiss()
            }) {
                Text("Dismiss")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(.horizontal, 40)
    }
}

struct HomeView: View {
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // Your main content view
            VStack {
                Text("Main Content")
                Button(action: {
                    withAnimation {
                        showAlert = true
                    }
                }) {
                    Text("Show Alert")
                }
            }

            // Background overlay
            if showAlert {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showAlert = false
                        }
                    }

                // Modal view with animation
                EmergencyAlertView(
                    title: "Emergency Alert",
                    message: "This is an important message. Please read it carefully.",
                    onDismiss: {
                        withAnimation {
                            showAlert = false
                        }
                    }
                )
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
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

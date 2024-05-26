//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct WarningView: View {
    @State private var showWarning = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0.0

    var body: some View {
        VStack {
            if showWarning {
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                        )

                    Text("Warning!")
                        .font(.largeTitle)
                        .foregroundColor(.red)

                    Text("This is a warning message. Please take action.")
                        .multilineTextAlignment(.center)
                        .padding()

                    Button(action: {
                        withAnimation {
                            showWarning = false
                        }
                    }) {
                        Text("Dismiss")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 10)
                .onAppear {
                    scale = 1.2
                    rotation = 360
                }
                .onDisappear {
                    scale = 1.0
                    rotation = 0.0
                }
                .transition(.move(edge: .top))
                .animation(.spring())
            }

            Spacer()

            Button(action: {
                withAnimation {
                    showWarning = true
                }
            }) {
                Text("Show Warning")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct HomeView: View {
    var body: some View {
        WarningView()
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

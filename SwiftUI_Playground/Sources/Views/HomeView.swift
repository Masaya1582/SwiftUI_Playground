//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    @State private var rotationAmount: Double = 0

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)

                VStack(spacing: 16) {
                    Spacer()

                    Text("1234 5678 9101 1121")
                        .font(.system(size: 20))
                        .foregroundColor(.white.opacity(0.8))

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Card Holder")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            Text("John Doe")
                                .foregroundColor(.white)
                        }

                        Spacer()

                        VStack(alignment: .trailing) {
                            Text("Expires")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            Text("12/24")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
            .frame(width: 300, height: 200)
            .cornerRadius(15)
            .rotation3DEffect(
                .degrees(rotationAmount),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                    rotationAmount = 20
                }
            }
            Spacer()
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

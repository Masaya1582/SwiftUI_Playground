//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showCheckmark = false
    @State private var animateCheckmark = false
    @State private var showConfetti = false

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            // Animated Checkmark
            if showCheckmark {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.green)
                    .scaleEffect(animateCheckmark ? 1.0 : 0.5)
                    .opacity(animateCheckmark ? 1.0 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0.5), value: animateCheckmark)
                    .onAppear {
                        animateCheckmark = true
                    }
            }

            // Registration completed message
            Text("Registration Completed!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .transition(.opacity)

            Spacer()

            // Confetti animation trigger
            if showConfetti {
                ConfettiView()
                    .transition(.scale)
            }

            // Finish Button
            Button(action: {
                withAnimation {
                    showConfetti.toggle()
                }
            }) {
                Text("Celebrate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .padding()
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                showCheckmark = true
            }
        }
    }
}

struct ConfettiParticle: View {
    let colors: [Color] = [.red, .yellow, .blue, .green, .orange, .pink, .purple]

    var body: some View {
        Circle()
            .fill(colors.randomElement()!)
            .frame(width: 10, height: 10)
    }
}

struct ConfettiView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            ForEach(0..<20, id: \.self) { _ in
                ConfettiParticle()
                    .offset(x: isAnimating ? CGFloat.random(in: -200...200) : 0, y: isAnimating ? CGFloat.random(in: 400...600) : 0)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(
                        Animation.easeOut(duration: 3)
                            .repeatForever(autoreverses: false),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
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

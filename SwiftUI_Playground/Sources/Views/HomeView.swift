//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        OnboardingContainerView()
    }
}

struct OnboardingView: View {
    let imageName: String
    let title: String
    let description: String
    let showNextButton: Bool
    let onNext: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 10)

            Spacer()

            if showNextButton {
                Button(action: onNext) {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            } else {
                Button(action: onNext) {
                    Text("Get Started")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

struct OnboardingContainerView: View {
    @State private var currentStep = 0

    var body: some View {
        VStack {
            if currentStep == 0 {
                OnboardingView(
                    imageName: "star.fill",
                    title: "Welcome",
                    description: "Discover the best features of our app.",
                    showNextButton: true,
                    onNext: { currentStep += 1 }
                )
            } else if currentStep == 1 {
                OnboardingView(
                    imageName: "globe",
                    title: "Explore",
                    description: "Connect with the world and share your thoughts.",
                    showNextButton: true,
                    onNext: { currentStep += 1 }
                )
            } else if currentStep == 2 {
                OnboardingView(
                    imageName: "person.2.fill",
                    title: "Connect",
                    description: "Find friends and build your network.",
                    showNextButton: true,
                    onNext: { currentStep += 1 }
                )
            } else if currentStep == 3 {
                OnboardingView(
                    imageName: "checkmark.circle.fill",
                    title: "Ready to Start?",
                    description: "You are all set to explore the app.",
                    showNextButton: false,
                    onNext: {
                        // Handle the end of the walkthrough
                        print("Walkthrough finished")
                    }
                )
            }
        }
        .animation(.easeInOut, value: currentStep)
        .transition(.slide)
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

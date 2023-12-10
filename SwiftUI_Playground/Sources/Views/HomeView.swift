//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Pastel light blue background
            Color(red: 0.8, green: 0.9, blue: 1.0)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    // Settings button at the top right
                    Button(action: settingsButtonTapped) {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    }
                    .padding()
                }

                Text("Quabble Panic Button")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Text("If you're feeling unsafe or anxious...")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)

                Button(action: panicButtonTapped) {
                    ZStack {
                        Circle()
                            .fill(Color.red) // Bright red button color
                            .frame(width: 300, height: 300)
                            .shadow(radius: 10)

                        Text("PRESS")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding()

                VStack(alignment: .leading, spacing: 5) {
                    Text("When you press the Panic Button, it will:")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Group {
                        StepView(number: "1", description: "Call Boyfriend")
                        StepView(number: "2", description: "Text Dad \"Hey Dad, are you free? Call me now please.\"")
                        StepView(number: "3", description: "Text Ms Johnson (Therapist) \"I am not feeling well\"")
                    }
                }
                .padding()
            }
            .padding()
        }
    }

    private func panicButtonTapped() {
        print("Panic Button Tapped")
    }

    private func settingsButtonTapped() {
        print("Settings Button Tapped")
    }
}

struct StepView: View {
    let number: String
    let description: String

    var body: some View {
        HStack {
            Text("\(number).")
                .bold()
                .foregroundColor(.primary)
                .padding([.top, .bottom, .leading])

            Text(description)
                .foregroundColor(.secondary)
                .padding([.top, .bottom, .trailing])
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

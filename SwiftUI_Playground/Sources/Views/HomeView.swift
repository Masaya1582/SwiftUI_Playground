//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    @State private var showNextView = false

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                OnboardingView(title: "Step 1", description: "This is the first step.")
                    .tag(0)
                    .background(selection == 0 ? Color(red: 243 / 255, green: 215 / 255, blue: 145 / 255) : Color.clear)
                OnboardingView(title: "Step 2", description: "This is the second step.")
                    .tag(1)
                    .background(selection == 1 ? Color(red: 174 / 255, green: 187 / 255, blue: 235 / 255) : Color.clear)
                OnboardingView(title: "Step 3", description: "This is the final step.")
                    .tag(2)
                    .background(selection == 2 ? Color(red: 181 / 255, green: 232 / 255, blue: 211 / 255) : Color.clear)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(selection == 0 ? Color(red: 243 / 255, green: 215 / 255, blue: 145 / 255) : selection == 1 ? Color(red: 174 / 255, green: 187 / 255, blue: 235 / 255) : selection == 2 ? Color(red: 181 / 255, green: 232 / 255, blue: 211 / 255) : Color.clear)
            .edgesIgnoringSafeArea(.all)

            if selection == 2 {
                VStack {
                    Spacer()
                    Button(action: {
                        showNextView.toggle()
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $showNextView, content: {
                        ProgressView()
                    })
                }
            }
        }
    }
}

struct OnboardingView: View {
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 20) {
            if title == "Step 1" {
                Text("🔍")
                    .font(.system(size: 50))
            } else if title == "Step 2" {
                Text("✍️")
                    .font(.system(size: 50))
            } else if title == "Step 3" {
                Text("🤗")
                    .font(.system(size: 50))
            }

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
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

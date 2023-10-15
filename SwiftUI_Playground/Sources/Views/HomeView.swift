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
            // Background color
            Color.pink
                .ignoresSafeArea()

            // Confetti
            ConfettiView()

            VStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)

                Text("Welcome to the Cutest App!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)

                Text("Get ready for adorable experiences.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 10)

                Button(action: {
                    // Handle button action (e.g., navigate to the main app)
                }) {
                    Text("Start Exploring")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.top, 30)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

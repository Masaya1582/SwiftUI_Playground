//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct RestrictedFeaturesCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Optional Icon
            Image(systemName: "lock.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)

            // Title
            Text("Some Features are Restricted")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            // Subtitle
            Text("Upgrade to unlock all features and enjoy the full experience.")
                .font(.body)
                .foregroundColor(.secondary)

            // Optional Button
            Button(action: {
                // Action for upgrade
            }) {
                Text("Upgrade Now")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

struct HomeView: View {
    var body: some View {
        RestrictedFeaturesCard()
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

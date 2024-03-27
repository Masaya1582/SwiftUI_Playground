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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) { item in
                    CardView()
                }
            }
            .padding()
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Asset.Assets.imgYoshi.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(10)

            Text("Card Title")
                .fontWeight(.bold)

            Text("Description goes here.")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 200, height: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
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

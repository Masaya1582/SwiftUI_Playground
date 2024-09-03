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
        VStack(spacing: 20) {
            // Original Image
            Image("img_spaghetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .background(Color.gray.opacity(0.3))
                .overlay(Text("Original Image").foregroundColor(.white).padding(), alignment: .bottom)

            // Clipped Image with Aspect Fill
            Image("img_spaghetti")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .clipped()
                .background(Color.gray.opacity(0.3))
                .overlay(Text("Aspect Fill with Clipping").foregroundColor(.white).padding(), alignment: .bottom)

            // Image with Rounded Corners
            Image("img_spaghetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .background(Color.gray.opacity(0.3))
                .overlay(Text("Rounded Corners").foregroundColor(.white).padding(), alignment: .bottom)

            // Image clipped to a Circle
            Image("img_spaghetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .background(Color.gray.opacity(0.3))
                .overlay(Text("Circle Clip").foregroundColor(.white).padding(), alignment: .bottom)
        }
        .padding()
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

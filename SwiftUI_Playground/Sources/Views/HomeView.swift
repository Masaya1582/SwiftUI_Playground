//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        VStack {
            Text("Current Mode: \(colorSchemeManager.colorScheme == .light ? "Light" : "Dark")")
                .padding()

            Button(action: {
                colorSchemeManager.toggleColorScheme()
            }) {
                Text("Toggle Dark/Light Mode")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
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

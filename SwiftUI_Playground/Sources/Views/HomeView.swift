//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 32) {
            Button("Buy: $0.99") {
                print("Buying…")
            }
            .buttonStyle(.bordered)

            Button("Buy: $0.99") {
                print("Buying for $0.99")
            }
            .buttonStyle(.borderedProminent)

            Button("Submit") {
                print("Submitting…")
            }
            .tint(.indigo)
            .buttonStyle(.borderedProminent)

            Button("Delete", role: .destructive) {
                print("Deleting…")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

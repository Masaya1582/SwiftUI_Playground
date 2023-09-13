//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 28) {
            Text(String(count))
                .font(.custom(FontFamily.Caprasimo.regular, size: 40))

            Button {
                count += 1
            } label: {
                Text("Increment")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            }

            Button {
                count -= 1
            } label: {
                Text("Decrement")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            }

            Button {
                count = 0
            } label: {
                Text("Reset")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 28) {
            Label("Your account", systemImage: "folder.circle")
            Label("Welcome to the app", image: "YOUR_IMAGE")
            Label("Your account", systemImage: "person.crop.circle")
                .font(.title)
            Label {
                Text("Brad Pitt")
                    .foregroundStyle(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: 64, height: 64)
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var contentAvailable = false

    var body: some View {
        VStack {
            if contentAvailable {
                Text("Your content here")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
                Asset.Assets.imgDio.swiftUIImage
                    .modifier(CustomImage(width: 300, height: 300))
            } else {
                ContentUnavailableView(message: "Content is currently unavailable.", contentAvailable: $contentAvailable)
            }
        }
    }
}

struct ContentUnavailableView: View {
    var message: String
    @Binding var contentAvailable: Bool

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.orange)
                .padding(.bottom, 20)

            Text(message)
                .font(.headline)
                .foregroundColor(.gray)

            Button("Retry") {
                withAnimation {
                    contentAvailable.toggle()
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .padding()
        .frame(maxWidth: .infinity)
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

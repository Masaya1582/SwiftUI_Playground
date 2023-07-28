//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Asset.Assets.imgMrsalt.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .offset(y: isAnimating ? 300 : -300)
                .animation(.easeInOut(duration: 2))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                )
            Button {
                isAnimating.toggle()
            } label: {
                Text("Drop an image")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var scale = 1.0
    @State private var angle = 0.0
    @State private var borderThickness = 1.0

    var body: some View {
        VStack {
            Button {
                scale += 1
            } label: {
                Asset.Assets.imgDio.swiftUIImage
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            .scaleEffect(scale)
            .animation(.linear(duration: 1), value: scale)

            Button("Press here") {
                angle += 45
                borderThickness += 1
            }
            .padding()
            .border(.red, width: borderThickness)
            .rotationEffect(.degrees(angle))
            .animation(.easeIn, value: angle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

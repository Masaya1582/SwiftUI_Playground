//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var blurAmount = 0.0

    var body: some View {
        VStack {
            Asset.Assets.imgHeadmaster.swiftUIImage
                .resizable()
                .frame(width: 300, height: 300)
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

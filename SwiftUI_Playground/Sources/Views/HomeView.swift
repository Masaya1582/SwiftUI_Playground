//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .frame(width: 320, height: 280)
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .frame(width: 320, height: 280)
        }
        .overlay(RoundedRectangle(cornerRadius: 30)
            .stroke(Color.black, lineWidth: 3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

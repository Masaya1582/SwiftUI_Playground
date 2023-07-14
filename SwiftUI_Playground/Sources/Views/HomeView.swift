//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Asset.Assets.imgDonald.swiftUIImage
            .resizable()
            .frame(width: 300, height: 300)
            .shadow(color: Color.gray.opacity(0.6), radius: 4, x: 10, y: 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

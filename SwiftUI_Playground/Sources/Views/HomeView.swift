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
            Text("Dio")
                .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .frame(width: 320, height: 280)
            Text("関係ない、行け")
                .font(.custom(FontFamily.Caprasimo.regular, size: 42))
                .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            Spacer().frame(height: 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

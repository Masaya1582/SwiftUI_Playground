//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedIndex = 0

    var body: some View {
        VStack {
            Picker("", selection: $selectedIndex) {
                Text("赤のView")
                    .tag(0)
                Text("青のView")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            if selectedIndex == 0 {
                Asset.Assets.imgDio.swiftUIImage
                    .resizable()
            } else {
                Asset.Assets.imgKotowaru.swiftUIImage
                    .resizable()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

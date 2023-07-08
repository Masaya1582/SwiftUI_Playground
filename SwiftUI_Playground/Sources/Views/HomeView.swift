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
                Text("関係ない、行け")
                    .tag(0)
                Text("だが断る")
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

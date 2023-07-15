//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isCounting = false
    @State private var countText: String = "カウントスタート"

    var body: some View {
        VStack(spacing: 24) {
            Text(countText)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Button(action: {
                isCounting = true
            }) {
                Text("CountViewを表示")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
            }
            .sheet(isPresented: $isCounting) {
                CountView(isCounting: $isCounting, countText: $countText)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

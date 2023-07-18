//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowHalfView = false

    var body: some View {
        VStack {
            Button {
                isShowHalfView = true
            } label: {
                Text("Show HalfModalView")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            }
        }
        .sheet(isPresented: $isShowHalfView) {
            CustomHalfView()
                .presentationDetents([.medium])
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

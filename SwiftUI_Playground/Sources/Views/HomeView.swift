//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button {
            requestReview()
        } label: {
            Text("Review the App")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

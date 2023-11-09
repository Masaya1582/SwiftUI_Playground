//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit
import StoreKit

struct HomeView: View {
    @Environment(\.requestReview) var requestView

    var body: some View {
        Text("Hello Japan")
            .padding()
            .onAppear {
                requestView()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

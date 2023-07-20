//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var defaultViewModel = DefaultViewModel()

    var body: some View {
        ZStack {
            FancyLoadingView()
                .opacity(isContentLoading ? 1 : 0)
        }
    }

    var isContentLoading: Bool {
        // Return true when your content is loading
        return true
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 50) {
            Text("触れないテキスト")
                .font(.largeTitle)

            Text("触れるテキスト")
                .font(.largeTitle)
                .textSelection(.enabled)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

struct HomeView: View {
    @StateObject private var viewModel = ZipViewModel()

    var body: some View {
        VStack(spacing: 28) {
            ForEach(viewModel.zipResult, id: \.0) { value in
                Text("\(value.0) - \(value.1)")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            }
        }
        .onAppear {
            viewModel.performZip()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ScanViewModel()

    var body: some View {
        VStack(spacing: 28) {
            ForEach(viewModel.scanResult, id: \.self) { value in
                Text("\(value)")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            }
        }
        .onAppear {
            viewModel.performScan()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

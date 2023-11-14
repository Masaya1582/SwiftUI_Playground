//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NASAViewModel()
    private let apiKey = "<#YOUR API KEY#>"

    var body: some View {
        VStack {
            if let nasaData = viewModel.nasaData {
                VStack {
                    Text(nasaData.title)
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                    Text(nasaData.explanation)
                        .modifier(CustomLabel(foregroundColor: .gray, size: 16))
                        .padding()

                    if let imageData = viewModel.imageData, let image = UIImage(data: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchData(key: apiKey)
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

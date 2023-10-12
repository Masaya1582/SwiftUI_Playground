//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: APIRequestViewModel

    var body: some View {
        VStack {
            switch viewModel.requestStatus {
            case .idle:
                Text("Tap the button to fetch data")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            case .loading:
                ProgressView("Loading...")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            case .success:
                Text("Data fetched successfully!")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            }
            Button("Fetch Data") {
                viewModel.fetchData()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewModel: APIRequestViewModel())
                .preferredColorScheme(.light)
            HomeView(viewModel: APIRequestViewModel())
                .preferredColorScheme(.dark)
        }
    }
}

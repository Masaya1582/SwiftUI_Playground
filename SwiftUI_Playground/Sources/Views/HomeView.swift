//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject private var itemViewModel = ItemViewModel()

    var body: some View {
        List(itemViewModel.items) { item in
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text(item.title)
                            .modifier(CustomLabel(foregroundColor: .black, size: 20))
                        Text(item.subtitle)
                            .modifier(CustomLabel(foregroundColor: .gray, size: 16))
                    }
                    Spacer()
                    AsyncImage(url: item.pictureURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                .frame(height: 100)
            }
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

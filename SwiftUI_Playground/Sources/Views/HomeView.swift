//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NewsRowView(article: article)
            }
            .navigationTitle("News")
        }
    }
}

struct NewsRowView: View {
    var article: NewsArticle

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.headline)
            Text(article.description)
                .font(.subheadline)
            Text("Posted: \(article.postedDate, formatter: DateFormatter.newsDateFormatter)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

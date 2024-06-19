// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var name = ""
    @Published var halfModalText = ""
    @Published var isFloatingViewVisible = false
    @Published var isOpenImagePicker = false
    @Published var isShowSourceTypeAlert = false
    @Published var isShowHalfModalView = false
    @Published var sourceType: UIImagePickerController.SourceType?
    @Published var selectedImage: UIImage?
    @Published var posts: [Post] = []

    init() {
        fetchPosts()
    }

    /// URLSessionとCombineを学ぶ
    private func fetchPosts() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: [Post].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .assign(to: &$posts)
        }
    }

}

final class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = [
        NewsArticle(title: "Breaking News", description: "Some breaking news description.", postedDate: Date()),
        NewsArticle(title: "Tech News", description: "Latest in tech world.", postedDate: Date().addingTimeInterval(-86400)),
        NewsArticle(title: "Sports Update", description: "Latest sports update.", postedDate: Date().addingTimeInterval(-172800))
    ]
}

extension DateFormatter {
    static let newsDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

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
        print("PR TEST")
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

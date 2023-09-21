// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var books: [Book] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchBooks()
    }

    func fetchBooks() {
        // Simulate a network request delay
        let publisher = Future<[Book], Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let books = [
                    Book(id: 1, title: "Book 1"),
                    Book(id: 2, title: "Book 2"),
                    Book(id: 3, title: "Book 3")
                ]
                promise(.success(books))
            }
        }

        publisher
            .receive(on: DispatchQueue.main) // Receive events on the main thread
            .sink(receiveCompletion: { _ in }) { [weak self] books in
                self?.books = books
            }
            .store(in: &cancellables)
    }
}

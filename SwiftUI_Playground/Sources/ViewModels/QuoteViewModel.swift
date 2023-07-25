// 
//  QuoteViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class QuoteViewModel: ObservableObject {
    @Published var quote: Quote = Quote(content: "Loading quote...", author: "")

    private var cancellables: Set<AnyCancellable> = []

    func fetchQuote() {
        guard let url = URL(string: "https://api.quotable.io/random") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Quote.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching quote: \(error)")
                    self?.quote = Quote(content: "Failed to fetch quote.", author: "")
                }
            }, receiveValue: { [weak self] quote in
                self?.quote = quote
            })
            .store(in: &cancellables)
    }
}

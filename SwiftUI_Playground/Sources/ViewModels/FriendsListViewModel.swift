// 
//  FriendsListViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class FriendsListViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchData()
    }

    func fetchData() {
        // Simulate fetching friends from a network request
        MockDataSource.fetchFriends()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] friends in
                self?.friends = friends
            }
            .store(in: &cancellables)
    }
}

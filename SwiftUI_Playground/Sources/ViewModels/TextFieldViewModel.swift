// 
//  TextFieldViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class TextFieldViewModel: ObservableObject {
    @Published var enteredText = ""
    private var cancellables = Set<AnyCancellable>()

    func setupDebounce() {
        $enteredText
            .debounce(for: .seconds(1.0), scheduler: DispatchQueue.main)
            .sink { text in
                // Handle text change after 1.0 seconds of inactivity
                print("Text after debounce: \(text)")
            }
            .store(in: &cancellables)
    }
}

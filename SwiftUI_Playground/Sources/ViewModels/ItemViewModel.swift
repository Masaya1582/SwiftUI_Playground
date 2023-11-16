//
//  ItemViewModel.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/11/16.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI
import Foundation

final class ItemViewModel: ObservableObject {
    @Published var items = [Item]()

    init() {
        if let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([String: [Item]].self, from: data)
                if let items = decodedData["items"] {
                    self.items = items
                }
            } catch {
                print("Error decodiing JSON: \(error)")
            }
        }
    }
}

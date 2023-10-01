//
//  Book.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
}

class BookStore: ObservableObject {
    @Published var books: [Book] = []
}

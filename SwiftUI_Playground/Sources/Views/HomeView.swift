//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let books: [Book] = [
        Book(title: "Book Title 1", subtitle: "Subtitle 1", imageName: "mycheese"),
        Book(title: "Book Title 2", subtitle: "Subtitle 2", imageName: "mycheese"),
        Book(title: "Book Title 3", subtitle: "Subtitle 3", imageName: "mycheese"),
        Book(title: "Book Title 4", subtitle: "Subtitle 4", imageName: "mycheese"),
        Book(title: "Book Title 5", subtitle: "Subtitle 5", imageName: "mycheese"),
        Book(title: "Book Title 6", subtitle: "Subtitle 6", imageName: "mycheese"),
        Book(title: "Book Title 7", subtitle: "Subtitle 7", imageName: "mycheese"),
        Book(title: "Book Title 8", subtitle: "Subtitle 8", imageName: "mycheese")
    ]

    var body: some View {
        NavigationView {
            BookListView(books: books)
                .navigationTitle("Book List")
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

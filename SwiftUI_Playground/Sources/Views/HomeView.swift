//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var author: String
}

struct HomeView: View {
    private let books = [
        Book(title: "1984", author: "George Orwell"),
        Book(title: "Brave New World", author: "Aldous Huxley"),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger"),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee"),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
        Book(title: "Moby Dick", author: "Herman Melville"),
        Book(title: "War and Peace", author: "Leo Tolstoy"),
        Book(title: "Hamlet", author: "William Shakespeare"),
        Book(title: "Pride and Prejudice", author: "Jane Austen"),
        Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien")
    ]

    var body: some View {
        NavigationView {
            List(books) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Books")
        }
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

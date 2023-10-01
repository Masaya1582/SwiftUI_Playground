//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var bookStore = BookStore()

    @State private var newBookTitle = ""
    @State private var newBookAuthor = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Title", text: $newBookTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Author", text: $newBookAuthor)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()

                Button(action: addBook) {
                    Text("Add Book")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(bookStore.books) { book in
                        BookRowView(book: book)
                    }
                    .onDelete(perform: removeBooks)
                }
            }
            .navigationTitle("My Book Collection")
            .navigationBarItems(leading: EditButton())
        }
    }

    private func addBook() {
        guard !newBookTitle.isEmpty && !newBookAuthor.isEmpty else { return }
        let newBook = Book(title: newBookTitle, author: newBookAuthor)
        bookStore.books.append(newBook)
        newBookTitle = ""
        newBookAuthor = ""
    }

    private func removeBooks(at offsets: IndexSet) {
        bookStore.books.remove(atOffsets: offsets)
    }
}

struct BookRowView: View {
    var book: Book

    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.headline)
            Text("Author: \(book.author)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(8)
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

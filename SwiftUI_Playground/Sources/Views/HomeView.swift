//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

import Foundation

struct Memo: Identifiable, Codable {
    var id: UUID = UUID()
    var content: String
    var date: Date = Date()
}

struct MemoRow: View {
    var memo: Memo

    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.headline)
            Text("\(memo.date, formatter: itemFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct HomeView: View {
    @ObservedObject var memoManager = MemoManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(memoManager.memos) { memo in
                    MemoRow(memo: memo)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Memos")
            .navigationBarItems(trailing: Button(action: {
                memoManager.addMemo(content: "New Memo")
            }) {
                Image(systemName: "plus")
            })
        }
    }

    func delete(at offsets: IndexSet) {
        memoManager.memos.remove(atOffsets: offsets)
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("memos") private var memosData: Data = Data()
    @State private var memos: [Memo] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(memos) { memo in
                    NavigationLink(destination: EditMemoView(onSave: saveMemo, memo: memo)) {
                        Text(memo.content)
                    }
                }
                .onDelete(perform: deleteMemo)
            }
            .navigationTitle("Memo App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EditMemoView(onSave: saveMemo)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear(perform: loadMemos)
    }

    private func saveMemo(_ memo: Memo) {
        if let index = memos.firstIndex(where: { $0.id == memo.id }) {
            memos[index] = memo
        } else {
            memos.append(memo)
        }
        saveMemos()
    }

    private func deleteMemo(at offsets: IndexSet) {
        memos.remove(atOffsets: offsets)
        saveMemos()
    }

    private func saveMemos() {
        do {
            memosData = try JSONEncoder().encode(memos)
        } catch {
            print("Error encoding memos: \(error)")
        }
    }

    private func loadMemos() {
        do {
            memos = try JSONDecoder().decode([Memo].self, from: memosData)
        } catch {
            print("Error decoding memos: \(error)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

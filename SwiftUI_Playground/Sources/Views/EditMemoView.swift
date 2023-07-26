//
//  EditMemoView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/26.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct EditMemoView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var memoContent: String = ""
    var onSave: (Memo) -> Void
    var memo: Memo?

    var body: some View {
        VStack {
            TextEditor(text: $memoContent)
                .padding()
            Spacer()
            Button("Save") {
                guard !memoContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                    return
                }
                let newMemo = Memo(content: memoContent)
                onSave(newMemo)
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle(memo == nil ? "Add Memo" : "Edit Memo")
        .onAppear {
            memoContent = memo?.content ?? ""
        }
    }
}

struct EditMemoView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemoView(onSave: { _ in })
    }
}

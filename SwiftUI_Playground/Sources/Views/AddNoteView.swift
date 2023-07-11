//
//  AddNoteView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/11.
//

import SwiftUI

struct AddNoteView: View {
    @State private var title = ""
    @State private var content = ""
    var onNoteSaved: (Note) -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
            }
            .navigationTitle("Add Note")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        let note = Note(title: title, content: content)
                        onNoteSaved(note)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(onNoteSaved: { _ in })
    }
}

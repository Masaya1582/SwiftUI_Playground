//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var notes = [
        Note(title: "Meeting Notes", content: "Discuss project timelines and goals."),
        Note(title: "Ideas for App", content: "Implement dark mode, add a widget."),
        Note(title: "Meeting Notes", content: "Discuss project timelines and goals."),
        Note(title: "Ideas for App", content: "Implement dark mode, add a widget.")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetail(note: note, notes: $notes)) {
                        NoteRow(note: note)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: NavigationLink(destination: AddNoteView(notes: $notes)) {
                Image(systemName: "plus")
            })
        }
    }

    private func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

struct NoteRow: View {
    var note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.title)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Text(note.content)
                .modifier(CustomLabel(foregroundColor: .gray, size: 12))
                .lineLimit(2)
        }
        .padding(8)
    }
}

struct NoteDetail: View {
    var note: Note
    @Binding var notes: [Note]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(note.title)
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Text(note.content)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
            Spacer()
        }
        .padding()
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: Button("Delete") {
            if let index = notes.firstIndex(where: { $0.id == note.id }) {
                notes.remove(at: index)
            }
        })
    }
}

struct AddNoteView: View {
    @State private var title = ""
    @State private var content = ""
    @Binding var notes: [Note]

    var body: some View {
        VStack(spacing: 16) {
            TextField("Title", text: $title)
                .modifier(CustomTextField())
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                TextEditor(text: $content)
                    .frame(minHeight: 100)
                    .padding()
                    .background(Color.clear)
            }
            Button("Save") {
                let newNote = Note(title: title, content: content)
                notes.append(newNote)
                title = ""
                content = ""
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .padding()
        .navigationBarTitle("Add Note")
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

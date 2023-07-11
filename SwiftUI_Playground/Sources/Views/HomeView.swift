//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var notes: [Note] = []
    @State private var isPresentingAddNoteSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notes, id: \.title) { note in
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        Text(note.content)
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isPresentingAddNoteSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddNoteSheet) {
                AddNoteView { note in
                    NoteManager.shared.saveMemo(note: note)
                    notes = NoteManager.shared.fetchNotes()
                }
            }
        }
        .onAppear {
            notes = NoteManager.shared.fetchNotes()
        }
    }

    private func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        // Update UserDefaults
        let updatedNotes = notes.map { $0 }
        let encodedNotes = try? JSONEncoder().encode(updatedNotes)
        UserDefaults.standard.set(encodedNotes, forKey: "notes")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  NoteManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/11.
//

import SwiftUI

class NoteManager {
    static let shared = NoteManager()
    private let notesKey = "notes"
    private init() {}

    func saveMemo(note: Note) {
        var existingNotes = fetchNotes()
        existingNotes.append(note)
        do {
            let encodedNotes = try JSONEncoder().encode(existingNotes)
            UserDefaults.standard.set(encodedNotes, forKey: notesKey)
        } catch {
            print("Failed to encode notes: \(error)")
        }
    }

    func fetchNotes() -> [Note] {
        guard let encodedNotes = UserDefaults.standard.data(forKey: notesKey) else {
            return []
        }
        do {
            let decodedNotes = try JSONDecoder().decode([Note].self, from: encodedNotes)
            return decodedNotes
        } catch {
            print("Failed to decode notes: \(error)")
            return []
        }
    }
}

//
//  NotesListView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 15/11/24.
//

import SwiftUI

struct NotesListView: View {
    @Environment(\.modelContext) private var context
    
    let book: Book
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(Array(book.notes.enumerated()), id: \.element) { index, note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(Theme.titleFont)
                    Text(note.message)
                        .font(Theme.bodyFont)
                        .foregroundStyle(.secondary)
                }
                .card()
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        deleteNote(IndexSet(integer: index))
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
    }
    
    func deleteNote(_ indexSet: IndexSet) {
        book.notes.remove(atOffsets: indexSet)
        context.extendedSave()
    }
}

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
        List {
            ForEach(book.notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .bold()
                    Text(note.message)
                }
            }
            .onDelete(perform: deleteNote)
        }
    }
    
    func deleteNote(_ indexSet: IndexSet) {
        book.notes.remove(atOffsets: indexSet)
        context.extendedSave()
    }
}

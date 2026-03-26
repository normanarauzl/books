//
//  AddNote.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 15/11/24.
//

import SwiftUI
import SwiftData

struct AddNote: View {
    let book: Book
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var message: String = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Message", text: $message)
        }
        .navigationTitle("Add new note")
        .scrollContentBackground(.hidden)
        .background(Theme.background)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let note = Note(title: title, message: message)
                    note.book = book
                    context.insert(note)
                    context.extendedSave()
                    dismiss()
                }
            }
        }
    }
}

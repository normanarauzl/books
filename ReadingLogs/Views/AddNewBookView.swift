//
//  AddNewBookView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI
import SwiftData

struct AddNewBookView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publisedYear: Int?
    @State private var selectedGenre = Set<Genre>()
    
    private var isValid: Bool {
        !title.isEmpty && !author.isEmpty && publisedYear != 0
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Book title")
                TextField("Enter the title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Author", text: $author)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Published year", value: $publisedYear, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                GenreSelectionView(selectedGenre: $selectedGenre)
                
                HStack {
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    Button("Add") {
                        guard let publisedYear else { return }
                        let book = Book(title: title, author: author, publishedYear: publisedYear)
                        book.genres = Array(selectedGenre)
                        selectedGenre.forEach { genre in
                            genre.books.append(book)
                            context.insert(genre)
                        }
                        context.insert(book)
                        context.extendedSave()
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    .disabled(isValid == false)
                }
            }
            .padding()
            .navigationBarTitle("Add new book")
            
        }
    }
}

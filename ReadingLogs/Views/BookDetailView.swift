//
//  BookDetailView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI

struct BookDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing = false
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int?
    
    @State private var showNewAddNote: Bool = false
    @State private var selectedGenres = Set<Genre>()
    
    let book: Book
    
    init(book: Book) {
        self.book = book
        self._author = .init(initialValue: book.author)
        self._title = .init(initialValue: book.title)
        self._publishedYear = .init(initialValue: book.publishedYear)
        self._selectedGenres = .init(wrappedValue: Set(book.genres))
    }
    
    var body: some View {
        Form {
            if isEditing {
                Group {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Published Year", value: $publishedYear, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    
                    GenreSelectionView(selectedGenre: $selectedGenres)
                        .frame(height: 300)
                }
                .textFieldStyle(.roundedBorder)
                
                Button("Save") {
                    guard let publishedYear else { return }
                    book.title = title
                    book.author = author
                    book.publishedYear = publishedYear
                    book.genres = []
                    book.genres = Array(selectedGenres)
                    
                    selectedGenres.forEach { genre in
                        if !genre.books.contains(where: { b in
                            b.title == book.title
                        }) {
                            genre.books.append(book)
                        }
                    }
                    
                    context.extendedSave()
                    dismiss()
                }
                
            }
            else {
                Text(book.title)
                Text(book.author)
                Text("Published Year: \(book.publishedYear.description)")
                
                if book.genres.isEmpty == false {
                    HStack {
                        ForEach (book.genres) { genre in
                            Text(genre.name)
                                .font(.caption)
                                .padding(.horizontal)
                                .background(.green.opacity(0.3), in: .capsule)
                        }
                    }
                }
            }
            
            Section("Notes") {
                Button("Add note") {
                    showNewAddNote.toggle()
                }
                .sheet(isPresented: $showNewAddNote) {
                    NavigationStack {
                        AddNote(book: book)
                    }
                    .presentationDetents([.fraction(0.3)])
                    .interactiveDismissDisabled()
                }
                
                if book.notes.isEmpty {
                    ContentUnavailableView("No notes", systemImage: "note")
                } else {
                    NotesListView(book: book)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
            }
        }
        .navigationTitle("Book Detail")
    }
}

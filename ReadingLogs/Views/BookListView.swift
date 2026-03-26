//
//  BookListView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    @State private var presentAddNew: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookCellView(book: book)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .onDelete(perform: delete)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Theme.background)
            .navigationTitle("Reading Logs")
            .navigationDestination(for: Book.self) { BookDetailView(book: $0) }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .sheet(isPresented: $presentAddNew) {
                        AddNewBookView()
                    }
                }
            }
        }
    }
    
    private func delete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let book = books[index]
            context.delete(book)
            context.extendedSave()
        }
    }
}

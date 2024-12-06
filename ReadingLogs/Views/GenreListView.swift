//
//  GenreListView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 17/11/24.
//

import SwiftUI
import SwiftData

struct GenreListView: View {
    
    @Query(sort: \Genre.name)
    private var genres: [Genre]
    
    @Environment(\.modelContext) private var context
    @State private var presentAddNew: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(genres) { genre in
                    Text(genre.name)
                }
                .onDelete(perform: deleteGenre)
            }
            .navigationTitle("Literary Genre")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .sheet(isPresented: $presentAddNew) {
                        AddNewGenreView()
                            .presentationDetents([.fraction(0.3)])
                            .interactiveDismissDisabled()
                    }
                }
            }
        }
    }
    
    private func deleteGenre( _ indexSet: IndexSet) {
        indexSet.forEach(removeGenreAt)
    }
    
    private func removeGenreAt(index: Int) {
        let genreToRemove = genres[index]
        context.delete(genreToRemove)
        context.extendedSave()
    }
}

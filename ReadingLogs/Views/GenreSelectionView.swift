//
//  GenreSelectionView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 17/11/24.
//

import SwiftUI
import SwiftData

struct GenreSelectionView: View {
    
    @Query(sort: \Genre.name) private var genres: [Genre]
    @Binding var selectedGenre: Set<Genre>
    
    var body: some View {
        List {
            Section("List of Genres") {
                ForEach(genres) { genre in
                    HStack {
                        Text(genre.name)
                        Spacer()
                        Image(systemName: selectedGenre.contains(genre) ? "cirlce.fill" : "circle.dashed")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedGenre.contains(genre) == false {
                            selectedGenre.insert(genre)
                        } else {
                            selectedGenre.remove(genre)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

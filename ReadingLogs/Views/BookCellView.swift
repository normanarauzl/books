//
//  BookCellView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI

struct BookCellView: View {
    
    let book: Book
    
    var body: some View {
        
        NavigationLink(value: book) {
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title)
                    .font(Theme.titleFont)
                
                Text(book.author)
                    .font(Theme.bodyFont)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Text("Published \(book.publishedYear.description)")
                        .font(Theme.captionFont)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("Book")
                        .font(Theme.captionFont)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Theme.accent.opacity(0.12), in: Capsule())
                        .foregroundStyle(Theme.accent)
                }
            }
            .card()
        }
    }
}

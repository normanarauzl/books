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
            VStack(alignment: .leading) {
                Text(book.title)
                    .bold()
                
                HStack{
                    Text("Author: \(book.author)")
                    Spacer()
                    Text("Publised on \(book.publishedYear.description)")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.top)
            }
        }
    }
}

//
//  ContentView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Books", systemImage: "books.vertical.fill") {
                BookListView()
            }
            
            Tab("Genres", systemImage: "gear.circle") {
                GenreListView()
            }
        }
    }
}

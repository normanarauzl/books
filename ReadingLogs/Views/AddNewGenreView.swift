//
//  AddNewGenreView.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 17/11/24.
//

import SwiftUI

struct AddNewGenreView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            TextField("Genre name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            HStack {
                Button("Save") {
                    let genre = Genre(name: name)
                    context.insert(genre)
                    context.extendedSave()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Add new genre")
            Spacer()
        }
        .background(Theme.background)
    }
}

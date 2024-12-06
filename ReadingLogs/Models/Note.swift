//
//  Note.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 15/11/24.
//

import Foundation
import SwiftData

@Model
final class Note {
    var title: String
    var message: String
    var book: Book?
    
    init(title: String, message: String, book: Book? = nil) {
        self.title = title
        self.message = message
        self.book = book
    }
}

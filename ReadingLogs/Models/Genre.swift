//
//  Genre.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 17/11/24.
//

import Foundation
import SwiftData

@Model
final class Genre {
    var name: String
    var books: [Book] = []
    
    init(name: String) {
        self.name = name
    }
}

//
//  ReadingLogsApp.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 14/11/24.
//

import SwiftUI
import SwiftData

@main
struct ReadingLogsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Book.self])
        }
    }
}

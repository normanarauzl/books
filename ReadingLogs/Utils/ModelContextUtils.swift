//
//  ModelContextUtils.swift
//  ReadingLogs
//
//  Created by Norman Arauz on 17/11/24.
//

import Foundation
import SwiftData

extension ModelContext {
    func extendedSave() {
        do {
            try self.save()
        } catch {
            debugPrint("Error saving data: \(error.localizedDescription)")
        }
    }
}

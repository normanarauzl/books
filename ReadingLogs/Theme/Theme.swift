//
//  Theme.swift
//  ReadingLogs
//
//  Created by Codex on 26/03/26.
//

import SwiftUI

enum Theme {
    static let background = LinearGradient(
        colors: [
            Color(red: 0.97, green: 0.96, blue: 0.93),
            Color(red: 0.93, green: 0.95, blue: 0.98)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let surface = Color.white.opacity(0.92)
    static let accent = Color(red: 0.14, green: 0.36, blue: 0.62)
    static let shadow = Color.black.opacity(0.08)
    
    static let titleFont = Font.custom("AvenirNext-DemiBold", size: 18)
    static let bodyFont = Font.custom("AvenirNext-Regular", size: 15)
    static let captionFont = Font.custom("AvenirNext-Regular", size: 13)
    
    static let cornerRadius: CGFloat = 16
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(14)
            .background(Theme.surface, in: RoundedRectangle(cornerRadius: Theme.cornerRadius, style: .continuous))
            .shadow(color: Theme.shadow, radius: 10, x: 0, y: 6)
    }
}

extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
}

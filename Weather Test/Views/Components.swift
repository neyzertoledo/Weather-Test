//
//  Components.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.ultraThinMaterial)
            }
    }
}
extension View {
    func cardView() -> some View {
        modifier(CardModifier())
    }
}

#Preview {
    ContentView()
}

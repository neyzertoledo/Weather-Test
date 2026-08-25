//
//  Components.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

// TODO: refactor to wraper like VStack/HStack
struct CardView<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
}

#Preview {
    ContentView()
}

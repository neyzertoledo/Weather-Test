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

struct GradientLineView: View {
    let widthPercent: CGFloat
    let startPercent: CGFloat
    var point: CGFloat? = nil

    var body: some View {
        GeometryReader { geo in

            let width = geo.size.width

            Capsule()
                .fill(.gray.opacity(0.3))
                .frame(height: 4)
                .overlay(alignment: .leading) {

                    Capsule()
                        .fill(.blue)
                        .frame(
                            width: width * widthPercent,
                            height: 4
                        )
                        .offset(x: width * startPercent)
                }
                .overlay(alignment: .leading) {
                    if point != nil {
                        Capsule()
                            .fill(.white)
                            .frame(
                                width: 10,
                                height: 10
                            )                            .clipShape(Circle())
                            .offset(x: width * point!)
                    }
                }
        }
        .frame(height: 4)
    }
}


#Preview {
    VStack {
        CardView {
            Text("Hello, World!")
            GradientLineView(widthPercent: 0.5, startPercent: 0.1, point: 0.5)
        }
    }
}

//
//  ContentView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showLocations: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing)  {
                HomeView()

                Button {
                    showLocations = true
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title3)
                        .foregroundStyle(.primary)
                        .frame(width: 50, height: 50)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
        .sheet(isPresented: $showLocations) {
            LocationsView()
        }
    }
}


#Preview {
    ContentView()
}

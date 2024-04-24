//
//  ContentView.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var movies: [Movie]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                movies = try await mcuAPI.getMovies()
            }
            catch {
               // Egg
            }
        }
    }
}

#Preview {
    ContentView(movies: [])
}

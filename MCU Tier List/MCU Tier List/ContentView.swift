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
        NavigationView {
            VStack {
                Image("mcu-logo")
                    .resizable()
                    .frame(height: 200)
                Text("Tier List")
                    .fontDesign(.monospaced)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                NavigationLink("Start", destination: MovieRatingCarousel(allMovies: $movies))
                Spacer()
            }
            .task {
                print("Getting movies")
                do {
                    movies = try await mcuAPI.getMovies()
                    print(movies)
                }
                catch {
                    print(error)
                }
            }
            .background(.black)
        }
    }
}

#Preview {
    ContentView(movies: [])
}

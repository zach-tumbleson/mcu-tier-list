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
        TabView {
            NavigationView {
                VStack {
                    Image("mcu-logo")
                        .resizable()
                        .frame(height: 200)
                    Text("Tier List")
                        .fontDesign(.monospaced)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: MovieRatingCarousel(allMovies: $movies)) {
                        Text("Start")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .padding(40)
                            .background(.red)
                            .cornerRadius(16)
                    }
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
            .tabItem { Label("Movies", systemImage: "film.stack") }
            Text("egg")
                .tabItem { Label("Ratings", systemImage: "chart.bar")}
        }
    }
}

#Preview {
    ContentView(movies: [])
}

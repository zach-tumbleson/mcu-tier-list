//
//  ContentView.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var movies: [Movie] = []
    @StateObject var ratingStore: RatingsStore = .init()
    
    init() {
      UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
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
                        movies = try await mcuAPI.getMovies().filter {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd"
                            let date = formatter.date(from: $0.releaseDate)!
                            return Date.now > date
                        }
                        
                        print(movies)
                    }
                    catch {
                        print(error)
                    }
                }
                .background(.black)
            }
            .tabItem { Label("Movies", systemImage: "film.stack") }
            MovieFinalTierListView()
                .tabItem { Label("Ratings", systemImage: "chart.bar")}
        }
        .environmentObject(ratingStore)
        .colorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

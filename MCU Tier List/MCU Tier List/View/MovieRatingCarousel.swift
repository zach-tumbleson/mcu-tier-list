//
//  MovieRatingCarousel.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieRatingCarousel: View {
    @Binding var allMovies: [Movie]
    @EnvironmentObject var ratingsStore: RatingsStore
    
    @State var ratedMovies: [MovieRating] = []
    @State var currentMovie: Movie? = nil
    @State var appeared: Bool = false
    
    var body: some View {
        if let movie = currentMovie {
            MovieRatingView(movie: movie) { rating in
                let movieRating = MovieRating(rating: rating, movie: movie)
                ratedMovies.append(movieRating)
                ratingsStore.add(rating: movieRating)
                
                guard let currentMovieIndex = allMovies.firstIndex(of: movie) else {
                    //todo
                    return
                }
                
                let nextMovieIndex = allMovies.index(after: currentMovieIndex)
                
                if nextMovieIndex >= allMovies.endIndex {
                    currentMovie = nil
                    return
                }
                
                let nextMovie = allMovies[nextMovieIndex]
                
                currentMovie = nextMovie
            }
            .navigationBarBackButtonHidden()
        } else {
            Text("You Finished!")
                .onAppear {
                    guard !appeared else { return }
                    
                    appeared = true
                    currentMovie = allMovies.first
                }
                .background(Color.black)
        }
    }
}

#Preview {
    MovieRatingCarousel(allMovies: .constant([.init(id: 1, title: "", releaseDate: "", coverUrl: "")]))
}

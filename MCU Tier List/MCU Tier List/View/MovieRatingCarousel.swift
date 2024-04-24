//
//  MovieRatingCarousel.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieRatingCarousel: View {
    @Binding var allMovies: [Movie]
    
    @State var ratedMovies: [MovieRating] = []
    @State var currentMovie: Movie? = nil
    
    var body: some View {
        if let movie = currentMovie {
            MovieRatingView(movie: movie) { rating in
                ratedMovies.append(.init(rating: rating, movie: movie))
                
                guard let currentMovieIndex = allMovies.firstIndex(of: movie) else {
                    //todo
                    return
                }
                
                let nextMovieIndex = allMovies.index(after: currentMovieIndex)
                let nextMovie = allMovies[nextMovieIndex]
                
                currentMovie = nextMovie
            }
            .navigationBarBackButtonHidden()
        } else {
            Text("oops")
                .onAppear {
                    currentMovie = allMovies.first
                }
        }
    }
}

#Preview {
    MovieRatingCarousel(allMovies: .constant([.init(id: 1, title: "", releaseDate: "", coverUrl: "")]))
}

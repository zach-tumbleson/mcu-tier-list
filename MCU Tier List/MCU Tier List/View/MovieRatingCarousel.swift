//
//  MovieRatingCarousel.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieRatingCarousel: View {
    let allMovies: [Movie]
    
    @State var ratedMovies: [MovieRating] = []
    @State var currentMovie: Movie
    
    init(allMovies: [Movie]) {
        self.allMovies = allMovies
        self.ratedMovies = []
        self.currentMovie = allMovies.first!
    }
    
    var body: some View {
        MovieRatingView(movie: currentMovie) { rating in
            ratedMovies.append(.init(rating: rating, movie: currentMovie))
            
            guard let currentMovieIndex = allMovies.firstIndex(of: currentMovie) else {
                //todo
                return
            }
            
            let nextMovieIndex = allMovies.index(after: currentMovieIndex)
            let nextMovie = allMovies[nextMovieIndex]
            
            currentMovie = nextMovie
        }
    }
}

#Preview {
MovieRatingCarousel(allMovies: [.init(id: 1, title: "", releaseDate: "", coverUrl: "")])
}

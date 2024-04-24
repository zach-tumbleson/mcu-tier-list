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
        MovieRatingView(movie: currentMovie)
    }
}

#Preview {
MovieRatingCarousel(allMovies: [.init(id: 1, title: "", release_date: "", cover_url: "")])
}

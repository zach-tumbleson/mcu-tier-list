//
//  MovieRating.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import Foundation

struct MovieRating: Identifiable {
    var rating: TierListElement
    let movie: Movie
    
    var id: Int { movie.id }
}

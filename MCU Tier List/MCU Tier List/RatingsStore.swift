//
//  RatingsStore.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import Foundation

class RatingsStore: ObservableObject {
    @Published var ratings: [MovieRating] = []
    
    init(ratings: [MovieRating] = []) {
        self.ratings = ratings
    }
    
    func add(rating: MovieRating) {
        ratings.append(rating)
    }
}

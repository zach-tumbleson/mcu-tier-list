//
//  RatingsStore.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import Foundation

class RatingsStore: ObservableObject {
    @Published var ratings: [MovieRating] = []
    
    func add(rating: MovieRating) {
        ratings.append(rating)
    }
}

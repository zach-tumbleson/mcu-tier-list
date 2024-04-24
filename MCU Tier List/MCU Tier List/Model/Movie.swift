//
//  Movie.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import Foundation

struct MovieContainer: Codable {
    let data: [Movie]
}

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let releaseDate: String
    let coverUrl: String
}

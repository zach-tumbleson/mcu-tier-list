//
//  Movie.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import Foundation

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let release_date: String
    let cover_url: String
}

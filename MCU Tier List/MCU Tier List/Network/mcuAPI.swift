//
//  marvelAPI.swift
//  MCU Tier List
//
//  Created by Zach Tumbleson on 4/24/24.
//

import Foundation

final class mcuAPI {
    static let baseURL = "https://mcuapi.herokuapp.com/api/v1/"
    
    static func getMovies() async throws -> [Movie] {
        let moviesAPI = "movies"
        
        var url = URL(string: baseURL)
        url?.append(path: moviesAPI)
        
        guard let url else { return [] }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (result, _) = try await URLSession.shared.data(from: url)
        
        let decoder =  JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let movieContainer = try decoder.decode(MovieContainer.self, from: result)
        
        return movieContainer.data
        
    }
}

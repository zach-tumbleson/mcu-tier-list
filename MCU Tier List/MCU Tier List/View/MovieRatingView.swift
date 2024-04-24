//
//  MovieRatingView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieRatingView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AsyncImage(
                url: .init(string: movie.cover_url),
                content: { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                },
                placeholder: {
                    ProgressView()
                })
            .ignoresSafeArea(.all)
            
            TierListView() { _ in
                
            }
        }
        .background(Color.black)
    }
}

#Preview {
    MovieRatingView(movie: .init(id: 1, title: "Thunderbolts", release_date: "2024-02-02", cover_url: "https://res.cloudinary.com/augustomarcelo/image/upload/v1658747271/mcuapi/gallery/Movies/thunderbolts/posters/1.jpg"))
}

#Preview {
    MovieRatingView(movie: .init(id: 1, title: "Thunderbolts", release_date: "2024-02-02", cover_url: "https://res.cloudinary.com/augustomarcelo/image/upload/v1675206317/mcuapi/gallery/Movies/iron_man/posters/1.jpg"))
}

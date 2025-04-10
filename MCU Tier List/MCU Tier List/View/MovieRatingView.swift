//
//  MovieRatingView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieRatingView: View {
    let movie: Movie
    let onRating: (TierListElement) -> ()
    
    var body: some View {
        VStack {
            AsyncImage(
                url: .init(string: movie.coverUrl),
                content: { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                },
                placeholder: {
                    Text(movie.title)
                })
            .ignoresSafeArea(.all)
            
            TierListView() { element in
                onRating(element)
            }
        }
        .background(Color.black)
    }
}

#Preview {
    MovieRatingView(movie: .init(id: 1, title: "Thunderbolts", releaseDate: "2024-02-02", coverUrl: "https://res.cloudinary.com/augustomarcelo/image/upload/v1658747271/mcuapi/gallery/Movies/thunderbolts/posters/1.jpg")) { _ in }
}

#Preview {
    MovieRatingView(movie: .init(id: 1, title: "Thunderbolts", releaseDate: "2024-02-02", coverUrl: "https://res.cloudinary.com/augustomarcelo/image/upload/v1675206317/mcuapi/gallery/Movies/iron_man/posters/1.jpg")) { _ in }
}

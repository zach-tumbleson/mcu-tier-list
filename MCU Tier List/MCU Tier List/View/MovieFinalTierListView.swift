//
//  MovieFinalTierListView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieFinalTierListView: View {
    @EnvironmentObject var  ratingsStore: RatingsStore
    @State var selectedRating: MovieRating?
    
    var ratingsGrouped: [TierListElement: [MovieRating]] {
        return .init(grouping: ratingsStore.ratings, by: { rating in return rating.rating })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 4) {
                ForEach(TierListElement.allCases, id: \.rawValue) { element in
                    ScrollView(.horizontal) {
                        HStack {
                            TierListElementView(element: element)
                                .frame(width: 100, height: 100)
                            
                            ForEach(ratingsGrouped[element] ?? [], id: \.movie.id) { movieRating in
                                AsyncImage(
                                    url: .init(string: movieRating.movie.coverUrl),
                                    content: { image in
                                        image
                                            .resizable()
                                            .frame(width: 100)
                                    },
                                    placeholder: {
                                        Text(movieRating.movie.title)
                                    })
                                .onTapGesture {
                                    selectedRating = movieRating
                                }
                            }
                        }
                    }
                    .frame(height: 100)
                }
            }
        }
        .background {
            Color.black
                .ignoresSafeArea(.all)
        }
        .popover(item: $selectedRating) { rating in
            VStack {
                AsyncImage(
                    url: .init(string: rating.movie.coverUrl),
                    content: { image in
                        image
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    },
                    placeholder: {
                        Text(rating.movie.title)
                    })
                
                TierListView { newRating in
                    var newRatingMovieCombo = rating
                    newRatingMovieCombo.rating = newRating
                    
                    ratingsStore.ratings.removeAll { $0.id == rating.movie.id }
                    
                    ratingsStore.ratings.append(newRatingMovieCombo)
                    selectedRating = nil
                }
            }
        }
    }
}

#Preview {
    MovieFinalTierListView()
        .environmentObject(RatingsStore(ratings: [.init(rating: .S, movie: .init(id: 1, title: "", releaseDate: "", coverUrl: "https://res.cloudinary.com/augustomarcelo/image/upload/v1658747271/mcuapi/gallery/Movies/thunderbolts/posters/1.jpg")), .init(rating: .A, movie: .init(id: 2, title: "", releaseDate: "", coverUrl: "https://res.cloudinary.com/augustomarcelo/image/upload/v1675206317/mcuapi/gallery/Movies/iron_man/posters/1.jpg"))]))
}




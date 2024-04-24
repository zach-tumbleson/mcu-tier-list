//
//  MovieFinalTierListView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct MovieFinalTierListView: View {
    let ratings: [MovieRating]
    
    var ratingsGrouped: [TierListElement: [MovieRating]] {
        return .init(grouping: ratings, by: { rating in return rating.rating })
    }
    
    var body: some View {
        ForEach(TierListElement.allCases, id: \.rawValue) { element in
            ScrollView {
                HStack {
                    TierListElementView(element: element)
                    
                    ForEach(ratingsGrouped[element] ?? [], id: \.movie.id) { movieRating in
                        AsyncImage(url: .init(string: movieRating.movie.coverUrl))
                    }
                }
            }
        }
    }
}

#Preview {
    MovieFinalTierListView(ratings: [])
}

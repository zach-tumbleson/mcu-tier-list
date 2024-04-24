//
//  TierListView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct TierListView: View {
    let onSelect: (TierListElement) -> ()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)], spacing: 5) {
            ForEach(TierListElement.allCases, id: \.rawValue) { element in
                Button {
                    onSelect(element)
                } label: {
                    TierListElementView(element: element)
                }
            }
        }
    }
}

#Preview {
    TierListView(onSelect: { _ in})
}

//
//  TierListElementView.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import SwiftUI

struct TierListElementView: View {
    let element: TierListElement
    
    var body: some View {
        Text(element.rawValue)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background {
                element.color
            }
    }
}

#Preview {
    TierListElementView(element: .A)
}

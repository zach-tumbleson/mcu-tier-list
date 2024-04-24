//
//  TierListElement.swift
//  MCU Tier List
//
//  Created by Nathan Molby on 4/24/24.
//

import Foundation
import SwiftUI

enum TierListElement: String, CaseIterable {
    case S
    case A
    case B
    case C
    case D
    case F
    
    var color: Color {
        switch self {
        case .S:
            return .init(red: 255/255, green: 127/255, blue: 127/255)
        case .A:
            return .init(red: 255/255, green: 191/255, blue: 127/255)
        case .B:
            return .init(red: 255/255, green: 223/255, blue: 127/255)
        case .C:
            return .init(red: 255/255, green: 255/255, blue: 127/255)
        case .D:
            return .init(red: 191/255, green: 255/255, blue: 127/255)
        case .F:
            return .init(red: 127/255, green: 255/255, blue: 127/255)
        }
    }
}

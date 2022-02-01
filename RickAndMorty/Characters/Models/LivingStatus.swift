//
//  LivingStatus.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation
import SwiftUI

enum LivingStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    
    var color: Color {
        switch self {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .gray
        }
    }
}

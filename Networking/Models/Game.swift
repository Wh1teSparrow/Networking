//
//  Game.swift
//  Networking
//
//  Created by Kirill Syrtsev on 12.11.2023.
//

import Foundation

struct VideoGame: Decodable {
    let internalName: String?
    let metacriticScore: String?
    let normalPrice: String?
    let salePrice: String?
    let savings: String?
    let steamRatingText: String?
}


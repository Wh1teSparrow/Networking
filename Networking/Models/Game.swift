//
//  Game.swift
//  Networking
//
//  Created by Kirill Syrtsev on 12.11.2023.
//

import Foundation

struct Game: Decodable {
    let title: String?
    let salePrice: String?
    let savings: String
    let steamRatingText: String?
    let thumb: URL
}


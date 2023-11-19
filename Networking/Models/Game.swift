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
    let thumb: String
    
    init(title: String?, salePrice: String?, savings: String, steamRatingText: String?, thumb: String) {
        self.title = title
        self.salePrice = salePrice
        self.savings = savings
        self.steamRatingText = steamRatingText
        self.thumb = thumb
    }
    
    init(gameData: [String: Any]) {
        title = gameData["title"] as? String ?? ""
        salePrice = gameData["salePrice"] as? String
        savings = gameData["savings"] as? String ?? ""
        steamRatingText = gameData["steamRatingText"] as? String
        thumb = gameData["thumb"] as? String ?? ""
    }
    
    static func getGames(from value: Any) -> [Game] {
        guard let gameData = value as? [[String: Any]] else { return [] }
        return gameData.compactMap { Game(gameData: $0) }
    }
}


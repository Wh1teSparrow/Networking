//
//  GameTableViewCell.swift
//  Networking
//
//  Created by Kirill Syrtsev on 14.11.2023.
//

import UIKit

final class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameSteamRatingLabel: UILabel!
    @IBOutlet weak var gameSavingsLabel: UILabel!
    @IBOutlet weak var gameSalericeLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(game: Game) {
        gameTitleLabel.text = game.title
        gameSteamRatingLabel.text = "Steam rating: \(game.steamRatingText ?? "no rating")"
        gameSavingsLabel.text = "Sale: \(String(format: "%.0f", Double(game.savings) ?? ""))%"
        gameSalericeLabel.text = "Price: \(game.salePrice ?? "0")$"
        
        networkManager.fetchImage(from: game.thumb) { result in
            switch result {
            case .success(let imageData):
                self.gameImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

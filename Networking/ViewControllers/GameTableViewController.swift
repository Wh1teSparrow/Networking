//
//  GameTableViewController.swift
//  Networking
//
//  Created by Kirill Syrtsev on 14.11.2023.
//

import UIKit
import Alamofire

final class GameTableViewController: UITableViewController {
    
    let networkManager = NetworkManager.shared
    
    private var games: [Game] = []
    
    
}

// MARK: - Table view data source
extension GameTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        guard let cell = cell as? GameTableViewCell else { return UITableViewCell()}
        
        let game = games[indexPath.row]
        
        cell.configure(game: game)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

// MARK: - Networking
extension GameTableViewController {
    func fetchGames() {
        networkManager.fetchGames(from: networkManager.url) { result in
            switch result {
                
            case .success(let games):
                self.games = games
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

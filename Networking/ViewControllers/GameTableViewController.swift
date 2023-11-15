//
//  GameTableViewController.swift
//  Networking
//
//  Created by Kirill Syrtsev on 14.11.2023.
//

import UIKit

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
        URLSession.shared.dataTask(with: networkManager.url) { [weak self] data, _, error in
            guard let data = data else {
                print(error.debugDescription)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                self?.games = try decoder.decode([Game].self, from: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
        
        //            networkManager.fetch(Game.self, from: networkManager.url) { result in
        //                switch result {
        //
        //                case .success(let  result):
        //                    self.games = [result]
        //                case .failure(_):
        //                    print("bgkk")
        //                }
        //            }
        //        }
    }
}

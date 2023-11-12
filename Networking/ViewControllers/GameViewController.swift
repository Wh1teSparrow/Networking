//
//  GameViewController.swift
//  Networking
//
//  Created by Kirill Syrtsev on 12.11.2023.
//

import UIKit

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}


final class GameViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
    
}

// MARK: UICollectionViewDataSource
extension GameViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.labelCell.text = "Rating and price"
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension GameViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fetchGamesInfo()
    }
}

extension GameViewController {
    private func fetchGamesInfo() {
        let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?upperPrice=15")!
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let games = try jsonDecoder.decode([VideoGame].self , from: data)
                self.showAlert(withStatus: .success)
                print(games)
            } catch let error {
                print(error.localizedDescription)
                self.showAlert(withStatus: .failed)
            }
            
            
        }.resume()
    }
}


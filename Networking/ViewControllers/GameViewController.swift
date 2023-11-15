//
//  GameViewController.swift
//  Networking
//
//  Created by Kirill Syrtsev on 12.11.2023.
//

import UIKit

//enum Alert {
//    case success
//    case failed
//    
//    var title: String {
//        switch self {
//        case .success:
//            return "Success"
//        case .failed:
//            return "Failed"
//        }
//    }
//    
//    var message: String {
//        switch self {
//        case .success:
//            return "You can see the results in the Debug area"
//        case .failed:
//            return "You can see error in the Debug area"
//        }
//    }
//}


final class GameViewController: UICollectionViewController {
    private let networkManager = NetworkManager.shared
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            guard let gameVC = segue.destination as? GameTableViewController else { return }
            gameVC.fetchGames()
        }
    }
    
//    private func showAlert(withStatus status: Alert) {
//        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okAction)
//        present(alert, animated: true)
//        
//    }

}

// MARK: UICollectionViewDataSource
extension GameViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.labelCell.text = "SALE"
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension GameViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gameSegue", sender: nil)
    }
}

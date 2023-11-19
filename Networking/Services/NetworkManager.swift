//
//  NetworkManager.swift
//  Networking
//
//  Created by Kirill Syrtsev on 14.11.2023.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?upperPrice=15")!
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchGames(from url: URL, comletion: @escaping(Result<[Game], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let games = Game.getGames(from: value)
                    comletion(.success(games))
                case .failure(let error):
                    comletion(.failure(error))
                }
                
            }
    }
}


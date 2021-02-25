//
//  NetworkManager.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import Foundation
import Alamofire

final class NetworkManager {

    static let shared = NetworkManager()

    static let baseUrl: String = "https://api.spacexdata.com/v4/"
    private let rocketsURL = baseUrl + Endpoint.rockets.rawValue
    
    private init() {}
    
    func getRockets(completed: @escaping (Result<Rockets, SXError>) -> Void) {
        guard let url = URL(string: rocketsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Rockets.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
   
}


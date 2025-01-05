//
//  NetworkManager.swift
//  MWA
//
//  Created by Dinesh Kumar.M on 04/01/25.
//

import Foundation
import Combine

struct NetworkManager {
    /// API Fetch Data
    /// - Parameters:
    ///   - url: URL Link
    ///   - completion: on success call closure
    static func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        print("NetworkManager: fetchData -> \(url.absoluteString)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                print("NetworkManager: fetchData -> \(error)")
                return
            }
            
            guard let data else {
                print("NetworkManager: fetchData -> No data")
                return
            }
            completion(.success(data))
            
        }.resume()
    
    }
    
    
    static func fetchData(url: URL) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
   
}

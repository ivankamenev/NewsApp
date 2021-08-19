//
//  NetworkManager.swift
//  NewsApp
//
//  Created by  Ivan Kamenev on 18.08.2021.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    struct Constants {
        static let topHeadinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7df6e8062be14e3f9f7bee66e9d0aee6")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let results = try JSONDecoder().decode(NetworkResponse.self, from: data)
                    completion(.success(results.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

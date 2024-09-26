//
//  NetworkService.swift
//  REALMHomework22
//
//  Created by Айгерим on 19.09.2024.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private let baseURL = URL(string: "https://api.chucknorris.io/jokes/random")!
    
    private init() {}
    
    func loadRandomJoke(completion: @escaping (JokeResponse?, Error?) -> Void) {
        let url = baseURL
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "Empty", code: -1, userInfo: nil))
                return
            }
            
            do {
                let jokeResponse = try JSONDecoder().decode(JokeResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(jokeResponse, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}

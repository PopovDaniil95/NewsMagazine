//
//  NetworkService.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews(complition: @escaping (Result<[Article], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getNews(complition: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=US&apiKey=93b2b322cda94a62a2c163ef389a5296"
        guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    complition(.failure(error))
                    return
                }
                do {
                    let obj = try JSONDecoder().decode(News.self, from: data!)
                    complition(.success(obj.articles))
                } catch {
                    complition(.failure(error))
                }
            }.resume()
        }
}

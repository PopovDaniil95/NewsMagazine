//
//  News.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import Foundation

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

// MARK: - Source
struct Source: Codable {
    let name: String
}

//
//  NetworkResponse.swift
//  NewsApp
//
//  Created by  Ivan Kamenev on 18.08.2021.
//

import Foundation

struct NetworkResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Codable {
    let name: String?
}

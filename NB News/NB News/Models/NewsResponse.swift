//
//  NewsResponse.swift
//  NB News
//
//  Created by Pankaj Verma on 25/11/22.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID?
    let name: String
}

enum ID: String, Codable {
    case bbcNews = "bbc-news"
    case businessInsider = "business-insider"
    case cnn = "cnn"
    case engadget = "engadget"
    case reuters = "reuters"
    case theVerge = "the-verge"
    case wired = "wired"
}

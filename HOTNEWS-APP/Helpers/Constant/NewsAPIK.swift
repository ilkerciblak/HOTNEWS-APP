//
//  NewsApiK.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

struct NewsApiK{
    static let apiKey = "18e529f7d9604f0686cd163f3d7b1b4c"
    static let apiKeyHeader = "X-Api-Key"
    static let baseUrl = "https://newsapi.org/v2"
    static let topHeadersEndPoint = "/top-headlines?"
    static let everythingEndPoint = "/everything?"
    static let categories = [
        "business",
        "entertainment",
        "general",
        "health",
        "science",
        "sports",
        "technology",
    ]
    
    
    
}




//
//  NewsApiK.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

struct NewsApiK{
    static let apiKey : String = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as! String
    static let apiKeyHeader = "X-Api-Key"
    static let baseUrl = "https://" + (Bundle.main.object(forInfoDictionaryKey: "BASEURL") as! String)
    static let topHeadersEndPoint = Bundle.main.object(forInfoDictionaryKey: "TOPHEADERS_EP") as! String
    static let everythingEndPoint = Bundle.main.object(forInfoDictionaryKey: "EVERYTHING_EP") as! String
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



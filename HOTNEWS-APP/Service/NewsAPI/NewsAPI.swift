//
//  NewsAPI.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

class NewsAPI{
    
    static let shared = NewsAPI()
    
    
    public func getData<T: Decodable>(with url:String, completionHandler: @escaping (Result<T, Error>) -> Void){
        let header = [
            NewsApiK.apiKeyHeader : NewsApiK.apiKey,
        ]
        NetworkService.shared.fetchData(with: url, header: header, completionHandler: completionHandler)
    }
    
    public func getTopHeaders(parameters: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<NewsResponse, Error>) -> Void){
        let endPoint = NewsApiK.baseUrl.configureUrlString(endPoint: NewsApiK.topHeadersEndPoint,parameters: ["country": "us"])
        
        getData(with: endPoint, completionHandler: completionHandler)
    }
    
    public func getTopHeadersCategory(with category: String, parameters: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<NewsResponse, Error>) -> Void){
        if  parameters != nil {
            var newParams = parameters!
            newParams["category"] = category
            getTopHeaders(parameters: newParams , completionHandler: completionHandler)
        }
        
        getTopHeaders(parameters: ["category" : category], completionHandler: completionHandler)
    }
    
    
    
}

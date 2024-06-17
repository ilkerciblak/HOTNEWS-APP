//
//  NewsAPI.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

class NewsAPI: IAPIService {
    
    
    var networkable: any Networkable = NetworkService.shared
    static let shared = NewsAPI()
    private let apiKey = NewsApiK.apiKey
    
    
    func createGetRequest<T>(with requestUrl: String, completionHandler: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        let header = [
            NewsApiK.apiKeyHeader : self.apiKey,
        ]
        networkable.getRequest(with: requestUrl, header: header, completionHandler: completionHandler)
    }
        
    public func getTopHeaders(parameters: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<NewsResponse, Error>) -> Void){
        let endPoint = NewsApiK.baseUrl.configureUrlString(endPoint: NewsApiK.topHeadersEndPoint,parameters: parameters ?? ["country": "us"])
        createGetRequest(with: endPoint, completionHandler: completionHandler)
    }
    
    public func getTopHeadersCategory(with category: String, parameters: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<NewsResponse, Error>) -> Void){
        if  parameters != nil {
            var newParams = parameters!
            newParams["category"] = category
            
            getTopHeaders(parameters: newParams , completionHandler: completionHandler)
        }
        
        getTopHeaders(parameters: ["category" : category, "country" : "us"], completionHandler: completionHandler)
    }
    
    
    
}

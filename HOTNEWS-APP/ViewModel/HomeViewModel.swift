//
//  HomeViewModel.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import Foundation

class HomeViewModel{
    
    static let shared = HomeViewModel()
    
    public var collection : [NewsCardViewModel] = [NewsCardViewModel]()
    
    public func getTopHeaders(completionHandler: @escaping (Result<[NewsCardViewModel],Error>) -> Void){
        print("getTopHeaders called")
        NewsAPI.shared.getTopHeaders{
            [weak self] (results) in
            
            switch results {
            case .success(let success):
                self?.collection = success.articles!.map{
                    body in
                    return NewsCardViewModel.fromArticle(body)
                }
                completionHandler(.success(self?.collection ?? []))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    
}

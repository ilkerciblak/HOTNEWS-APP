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
    
    public var rawCollection: [Article] = [Article]()
    
    public func getTopHeaders(completionHandler: @escaping (Result<[NewsCardViewModel],Error>) -> Void){
        NewsAPI.shared.getTopHeaders{
            [weak self] (results) in
            switch results {
            case .success(let success):
                self?.collection = success.articles!.map{
                    body in
                    return NewsCardViewModel.fromArticle(body)
                }
                self?.rawCollection = success.articles ?? []
                completionHandler(.success(self?.collection ?? []))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    public func getCategoryTopHeaders(category: String,completionHandler: @escaping (Result<[NewsCardViewModel], Error>) -> Void){
        NewsAPI.shared.getTopHeadersCategory(with: category){
            [weak self] (results) in
            switch results {
            case .success(let success):
                self?.collection = success.articles!.map{
                    body in
                    return NewsCardViewModel.fromArticle(body)
                }
                self?.rawCollection = success.articles ?? []
                completionHandler(.success(self?.collection ?? []))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
}

extension Array<Article>{
    
    func findIndex(title: String) -> Article? {
        return self.first(where: {$0.title == title}) ?? nil
    }
    
}

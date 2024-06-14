//
//  HeaderDetailViewModel.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 14.06.2024.
//

import Foundation

struct HeaderDetailViewModel{
    let imgUrl: String?
    let title: String?
    let description: String?
    let redirectUrl: String?
    let sourceName: String?
    let author: String?
    
    
    static func fromArticle(_ article: Article) -> HeaderDetailViewModel {
        return HeaderDetailViewModel(imgUrl: article.urlToImage ?? "", title: article.title ?? "", description: article.description ?? "", redirectUrl: article.url ?? "", sourceName: article.source.name ?? "", author: article.author)
    }
    
}

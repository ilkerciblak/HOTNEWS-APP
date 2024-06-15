//
//  NewsCardViewModel.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import Foundation

struct NewsCardViewModel{
    
    let title: String?
    let url2Image: String?
    let source: String?
    let url: String?
    
    var imgUrl : String {
        return url2Image ?? "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/breaking-news-banner-design-template-43d6dcbf37ca0a7d1450cb20f76b96fb_screen.jpg?ts=1677499703"
    }
    
    var newsTitle: String {
        return title ?? "Breaking News"
    }
    
    var sourceName : String {
        return source ?? "Undefined Source"
    }
    
    var sourceUrl: String {
            return url ?? "https://www.facebook.com"
    }
    
    static func fromArticle(_ article: Article) -> NewsCardViewModel {
        return NewsCardViewModel(title: article.title, url2Image: article.urlToImage, source: article.source.name, url: article.url)
    }
    
        
    
}

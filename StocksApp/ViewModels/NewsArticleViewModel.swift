//
//  NewsArticleViewModel.swift
//  StocksApp
//
//  Created by admin on 31/01/2024.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var imageUrl: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}

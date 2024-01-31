//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import Foundation

class StockListViewModel: ObservableObject{
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
    private func fetchNews() {
        Webservice().getTopNews { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.news = news.map(NewsArticleViewModel.init)
                }
            }
        }
    }
    
}

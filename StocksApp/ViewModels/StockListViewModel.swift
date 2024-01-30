//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import Foundation

class StockListViewModel: ObservableObject{
    
    var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
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
    
}

//
//  Webservice.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import Foundation
 
class Webservice {
    
    func getTopNews(completion: @escaping([Article]?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let news = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(news)
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URLs is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
            
        }.resume()
    }
    
    
    
}

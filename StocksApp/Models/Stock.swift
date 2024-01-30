//
//  Stock.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

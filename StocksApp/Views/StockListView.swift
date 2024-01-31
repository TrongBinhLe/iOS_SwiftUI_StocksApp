//
//  StockListView.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]

    var body: some View {
        List {
            ForEach(self.stocks, id: \.symbol) { stock in
                StockCellView(stock: stock)
            }.listRowBackground(Color.black)
        }
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
        .background(Color.black)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
        .cornerRadius(30)
        
    }
}

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading, content: {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(3)
                    
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
            })
            Spacer()
            VStack(alignment: .trailing, content: {
                Text("\(stock.price)")
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                Button(stock.change) {
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6.0)
            })
        }
    }
}

#Preview {
    StockListView(stocks: [StockViewModel.init(stock: Stock(symbol: "GOOG", description: "Google Stock", price: 1200, change: "+0.23"))])
}

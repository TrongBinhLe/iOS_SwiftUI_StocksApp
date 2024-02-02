//
//  ContentView.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm)}
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -320)
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(
                        y: -260
                    )
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 680)
                    }
                })
                .animation(Animation.spring(.bouncy), value: self.stockListVM.dragOffset)
                .offset(y: self.stockListVM.dragOffset.height)
                
            }
            .navigationBarTitle("Stocks")
            .navigationBarTitleDisplayMode(.automatic)
            .edgesIgnoringSafeArea([.bottom])
        }
    }
}

#Preview {
    ContentView()
}

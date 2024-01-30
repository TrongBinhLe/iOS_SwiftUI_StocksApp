//
//  ContentView.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                SearchView(searchTerm: $searchTerm)
                    .offset(y: -250)
            }
            .navigationBarTitle("Stocks")
            .navigationBarTitleDisplayMode(.automatic)
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

#Preview {
    ContentView()
}

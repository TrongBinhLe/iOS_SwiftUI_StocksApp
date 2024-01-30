//
//  SearchView.swift
//  StocksApp
//
//  Created by admin on 30/01/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: self.$searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            
            Spacer()
        }.foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

#Preview {
    SearchView(searchTerm: .constant(""))
}

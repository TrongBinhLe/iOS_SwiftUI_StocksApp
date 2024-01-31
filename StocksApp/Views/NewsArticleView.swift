//
//  NewsArticleView.swift
//  StocksApp
//
//  Created by admin on 31/01/2024.
//

import SwiftUI

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]

    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading, content: {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .padding(2)
                
                Text("From News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView{
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                }
                                Spacer()
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
        }).frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
    }
}

#Preview {
    let artile = Article(title: "News Title", imageURL:"https://blog-en.webroot.com/wp-content/uploads/2020/08/06154526/CNR-800x400_Twitter-hack.jpg", publication: "The WallStreet Journal ")
    return NewsArticleView(newsArticles: [NewsArticleViewModel.init(article: artile)])
}

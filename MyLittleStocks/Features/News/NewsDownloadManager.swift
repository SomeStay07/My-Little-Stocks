//
//  NewsDownloadManager.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 23.02.2021.
//

import Foundation

final class NewsDownloadManager: ObservableObject {
    
    @Published var newsArticles = [News]()
    
    private let newsUrlString = "https://newsapi.org/v2/top-headlines?country=us&categorybusiness&apiKey=\(NewsAPI.key)"
    
    init() {
        download()
    }
    
    private func download() {
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.newsArticles = response.articles
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}

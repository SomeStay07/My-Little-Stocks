//
//  StockQuoteManager.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    
    @Published  var quotes: [Quote] = []
    
    func download(
        stocks: [String],
        completion: @escaping (Result<[Quote], NetworkError>) -> Void
    ) {
        var internalQuotes = [Quote]()
        let downloadQueue  = DispatchQueue(label: "com.downloadQueue")
        let downloadGroup  = DispatchGroup()
        
        stocks.forEach { stock in
            downloadGroup.enter()
            let url = URL(string: API.quoteURL(for: stock))!
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { (result) in
                switch result {
                case .success(let response):
                    downloadQueue.sync {
                        internalQuotes.append(response.quote)
                        downloadGroup.leave()
                    }
                case .failure(let err):
                    downloadQueue.async {
                        print(err)
                        downloadGroup.leave()
                    }
                }
            }
        }   
        
        downloadGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(internalQuotes))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: internalQuotes)
            }
        }
    }
}

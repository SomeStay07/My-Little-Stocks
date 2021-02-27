//
//  QuoteManagerProtocol.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import Foundation

protocol QuoteManagerProtocol {
    
    var quotes: [Quote] { get set }
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}

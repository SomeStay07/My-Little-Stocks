//
//  GlobalQuote.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import Foundation

struct GlobalQuoteResponse: Decodable {
    
    let quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}

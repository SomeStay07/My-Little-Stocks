//
//  API.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import Foundation

struct API {
    static var baseURL: String {
        return "https://www.alphavantage.co/query?"
    }
    
    static func symbolSearchUrl(for searchKey: String) -> String {
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteURL(for searchKey: String) -> String {
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
        switch symbol {
        case .search:
            return "\(baseURL)function=\(symbol.rawValue)&apikey=\(key)&keywords=\(searchKey)"
        case .quote:
            return "\(baseURL)function=\(symbol.rawValue)&apikey=\(key)&symbol=\(searchKey)"
        }
    }
    
    enum SymbolFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote  = "GLOBAL_QUOTE"
    }
}

extension API {
    static var key: String {
        return "XF698YR24JMI71AH"
    }
}

//
//  Search.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 27.02.2021.
//

import Foundation

struct Search: Decodable, Identifiable {
    var id: UUID { return UUID() }
    let symbol: String
    let name: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
    }
}

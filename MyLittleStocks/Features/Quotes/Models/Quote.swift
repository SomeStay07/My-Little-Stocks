//
//  Quote.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import Foundation

struct Quote: Decodable {
    let symbol       : String
    let open         : String
    let high         : String
    let low          : String
    let price        : String
    let change       : String
    let changePercent: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol        = "01. symbol"
        case open          = "02. open"
        case high          = "03. high"
        case low           = "04. low"
        case price         = "05. price"
        case change        = "09. change"
        case changePercent = "10. change percent"
    }
}

extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}

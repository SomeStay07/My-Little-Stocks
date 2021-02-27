//
//  SearchResponse.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 27.02.2021.
//

import Foundation

struct SearchResponse: Decodable {
    let bestMatches: [Search]
}

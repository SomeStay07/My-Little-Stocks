//
//  NewsResponse.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 23.02.2021.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [News]
}

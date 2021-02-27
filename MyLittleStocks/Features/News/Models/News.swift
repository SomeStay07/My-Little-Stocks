//
//  News.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 23.02.2021.
//

import Foundation

struct News: Identifiable, Decodable {
    var id: UUID { return UUID() }
    let title: String
    let url: String
    let urlToImage: String?
    var imageUrl: String {
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://i.pinimg.com/originals/7b/28/98/7b2898990ae6ce6d6b277113d51b14e8.png"
    }
}

//
//  Array+Extensions.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 27.02.2021.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

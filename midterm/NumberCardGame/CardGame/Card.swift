//
//  Card.swift
//  CardGame
//
//  Created by Wen Hsin-Yu on 2020/3/25.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation
struct Card: Hashable {
    var isFlip = false
    var isFaceUp = false
    var isFirst = false
    var identifier: Int
    var hashvalue: Int{ return identifier }
    static var identifierFactory = 0
    static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        identifier = Card.getIdentifier()
    }
}

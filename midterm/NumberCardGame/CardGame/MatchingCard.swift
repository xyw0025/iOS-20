//
//  MatchingCard.swift
//  CardGame
//
//  Created by Wen Hsin-Yu on 2020/3/26.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation
struct MatchingCard {
    var cards = [Card]()
    mutating func chooseCard(at index: Int) {
        if cards[index].isFlip == false {
            cards[index].isFaceUp = true
            cards[index].isFlip = true
        }
    }

    var firstCardIndex: Int
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            let card = Card()
            cards += [card]
        }
        firstCardIndex = cards.count.arc4random
        cards[firstCardIndex].isFirst = true

//        隨機位置為第一張牌
    }
}

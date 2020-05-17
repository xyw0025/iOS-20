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

    private var indexOfOneAndOnlyFaceUpCard: Int? { // computed property
        get {
//            print(cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly)
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly

//            if there's only one face-up card then return the index, else return nil


//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else { // second face up card
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
                for index in cards.indices {
                    cards[index].isFaceUp = (index == newValue)
                // if index == newValue, card face up
                // if index != newValue, cards Face Down
            }
        }
    }

    var score = 0
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards matched
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFaceUp = true
            } else { // no cards are facing up or 2 cards facing up
                indexOfOneAndOnlyFaceUpCard = index
                // the set function would make cards facing down
            }
        }
        
    }

//    var firstCardIndex: Int
    init(numberOfCards: Int) {
        for _ in 1...((numberOfCards+1)/2) {

            let card = Card()
            cards += [card,card]
        }
//        隨機位置為第一張牌

        // TODO: SHUFFLE
        var switchCard: Card
        for index in 0..<numberOfCards {
            let randomIndex = numberOfCards.arc4random
            switchCard = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = switchCard
        }
//        firstCardIndex = cards.count.arc4random
//        cards[firstCardIndex].isFirst = true
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

//
//  Concentration.swift
//  Concentration
//
//  Created by Sytone on 2019/3/17.
//  Copyright © 2019 Sytone. All rights reserved.
//

// 记忆翻牌游戏

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    // 用来标识是否只有一张牌是正面
    var indexOfOneAndOnlyFaceUpCard: Int?

    
    func chooseCard(at index: Int) {
        // 如果选中的卡片并没有与其他卡片匹配
        if !cards[index].isMatched {
            // 如果在选中该卡片时，已有一个卡片被翻至正面
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 如果它们相匹配
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            // 选中该卡片时，没有牌是正面朝上的，或者已经匹配过一对卡片时
            else {
                for cardIndex in cards.indices {
                    cards[cardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}

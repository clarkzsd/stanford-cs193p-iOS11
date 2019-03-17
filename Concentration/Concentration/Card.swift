//
//  Card.swift
//  Concentration
//
//  Created by Sytone on 2019/3/17.
//  Copyright © 2019 Sytone. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false;
    var isMatched = false;
    
    // 卡片标识符，两张匹配了的卡片具有相同的标识符
    var identifier: Int
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueidentifier()
    }
    

    static func getUniqueidentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
}

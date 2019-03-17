//
//  ViewController.swift
//  Concentration
//
//  Created by Sytone on 2019/3/6.
//  Copyright © 2019 Sytone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
//    var flipCount = 0 {
//        didChangeValue() {
//            if flipCount ==
//            successLabel
//        }
//    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
//    @IBOutlet var successLabel: UILabel!
    
    var emojis = ["🐶","🐱", "🐭","🐹","🐰","🦊","🐻","🐼"];
    
    // Dictionary: key-value collection
    var emojiList = [Int: String]();
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber);
            updateViewFromModel();
        } else {
            print("Warning! The chosen card was not in cardButtons");
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index];
            let cardModal = game.cards[index]
            if cardModal.isFaceUp {
                button.setTitle(generateEmoji(for: cardModal), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            } else {
                button.setTitle("", for: .normal);
                button.backgroundColor = cardModal.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.6487010717, green: 0.0883314386, blue: 0.4992088675, alpha: 1)
            }
        }
    }
    
    func generateEmoji(for card: Card) -> String {
        // 如果卡片没有设置 emoji
        if emojiList[card.identifier] == nil, emojis.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiList[card.identifier] = emojis[randomIndex]
            emojis.remove(at: randomIndex)
        }
        return emojiList[card.identifier] ?? "?"
    }
    
}


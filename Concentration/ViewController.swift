//
//  ViewController.swift
//  Concentration
//
//  Created by Nino Pkhakadze on 14.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    var emojiChoices = ["🐳", "🐡", "🦩", "🐝", "🐌", "🐣", "🐴", "🪱", "🦭", "🦕", "🐍", "🦖" ]
    
    lazy var game = Concentration(numbersOfPairsOfCards: cardButtons.count/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        game.flipCount += 1
        flipCountLabel.text = "Flips: \(game.flipCount)"
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func StartNewGame(_ sender: UIButton) {
        game = Concentration(numbersOfPairsOfCards: cardButtons.count/2)
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.systemBlue
            }
        }
    }
    
    var emoji = [Card : String]()
    
    func emoji(for card : Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = emojiChoices.count.arc4random
            emoji[card] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        return Int(Int(arc4random_uniform(UInt32(self))))
    }
}


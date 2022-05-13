//
//  Concentration.swift
//  Concentration
//
//  Created by Nino Pkhakadze on 12.05.22.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var flipCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
    
    func chooseCard(at index : Int){
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                // check if cards match
                if cards[matchedIndex] == cards[index] {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //all cards down or 2 cards up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOfPairsOfCards : Int) {
        for _ in 0..<numbersOfPairsOfCards {
          let card = Card()
            cards.append(card)
            cards.append(card)
        }
        shuffleCards()
    }
    
    func shuffleCards() {
        var shuffledCards = [Card]()
        for _ in 0..<cards.count {
            shuffledCards.append(cards.remove(at: cards.count.arc4random))
        }
        self.cards = shuffledCards
    }
}

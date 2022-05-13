//
//  Card.swift
//  Concentration
//
//  Created by Nino Pkhakadze on 12.05.22.
//

import Foundation

struct Card : Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
}

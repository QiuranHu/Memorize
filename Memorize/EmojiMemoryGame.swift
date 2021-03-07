//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Qiuran on 2021/3/7.
//

import Foundation

// ViewModel
class EmojiMemoryGame {
    // private means this model can only be accessed by EmojiMemoryGame.
    // private(set) means that only EmojiMemoryGame can modify the model, but everyone else can still see the model.
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "😃", "😍"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

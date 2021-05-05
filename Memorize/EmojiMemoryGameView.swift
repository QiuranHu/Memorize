//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Qiuran on 2021/1/30.
//

import SwiftUI

struct EmojiMemoryGameView: View { // ContentView behaves like a View.
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // The value of the body property is not store in memory.
    // Every time the system ask for the value of body,
    // the code in the curly brace gets executed.
    var body: some View {
        return HStack {
            // Can put any iterable thing in ForEach,
            // where the things that's iterating over
            // are what is called identifiable.
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .aspectRatio(cardRatio, contentMode: .fit)
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let cardRatio: CGFloat = 2 / 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

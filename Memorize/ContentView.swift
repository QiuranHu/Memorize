//
//  ContentView.swift
//  Memorize
//
//  Created by Qiuran on 2021/1/30.
//

import SwiftUI

struct ContentView: View { // ContentView behaves like a View.
    var viewModel: EmojiMemoryGame
    
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
        .font(viewModel.cards.count >= 5 ? Font.title2 : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white).aspectRatio(2 / 3, contentMode: .fit)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3).aspectRatio(2 / 3, contentMode: .fit)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill().aspectRatio(2 / 3, contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

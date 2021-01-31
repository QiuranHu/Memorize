//
//  ContentView.swift
//  Memorize
//
//  Created by Qiuran on 2021/1/30.
//

import SwiftUI

struct ContentView: View { // ContentView behaves like a View.
    // The value of the body property is not store in memory.
    // Every time the system ask for the value of body,
    // the code in the curly brace gets executed.
    var body: some View {
        return HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            Text("👻")
            } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

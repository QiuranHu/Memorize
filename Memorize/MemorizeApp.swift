//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Qiuran on 2021/1/30.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

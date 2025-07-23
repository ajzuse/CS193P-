//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andrei Jiácomo Zuse on 19/07/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

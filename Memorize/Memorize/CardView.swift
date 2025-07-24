//
//  CardView.swift
//  Memorize
//
//  Created by Andrei Jiácomo Zuse on 23/07/25.
//

import SwiftUI

struct CardView : View {
    typealias Card = MemoryGame<String>.Card
    
    var card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body : some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(id: "Test1", isFaceUp: true, content: "W"))
                CardView(Card(id: "Test2", content: "X"))
            }
            HStack {
                CardView(Card(id: "Test3", isFaceUp: true, isMatched: true, content: "Y"))
                CardView(Card(id: "Test4", isMatched: true, content: "Z"))
            }
        }
        .padding()
        .foregroundColor(.green)
    }
}

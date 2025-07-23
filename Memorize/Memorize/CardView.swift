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
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
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

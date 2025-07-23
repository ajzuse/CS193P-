import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards : Array<Card>
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex)a", content: content))
            cards.append(Card( id: "\(pairIndex)b", content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card : Equatable, Identifiable{
        var id: String
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        static func ==(lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
        }
    }
}

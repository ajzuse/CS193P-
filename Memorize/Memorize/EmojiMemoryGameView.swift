import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4.0
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .foregroundColor(viewModel.color)
                    .animation(.default, value: viewModel.cards)
            }
            Button("Suffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards : some View {
        return AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

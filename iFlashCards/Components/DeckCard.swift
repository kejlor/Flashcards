//
//  DeckCard.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckCard: View {
    var deckVM: DeckViewModel
    
    var body: some View {
        ZStack {
            Card()
            
            VStack {
                Text(deckVM.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .lineLimit(1)
                
                Text("Ilość fiszek: \(deckVM.flashcards.count)")
                    .font(.caption)
            }
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
        }
    }
}

struct DeckCard_Previews: PreviewProvider {
    static var previews: some View {
        DeckCard(deckVM: DeckViewModel(deck: Deck.mockDecks[0]))
    }
}

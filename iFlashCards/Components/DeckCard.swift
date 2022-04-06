//
//  DeckCard.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckCard: View {
    var deck: Deck
    
    var body: some View {
        ZStack {
            Card(isFlipped: false)
            
            VStack {
                Text(deck.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .lineLimit(1)
                
                Text("Ilość fiszek: \(deck.flashcards.count)")
                    .font(.caption)
            }
            .foregroundColor(.accentColor)
            .multilineTextAlignment(.center)
        }
    }
}

struct DeckCard_Previews: PreviewProvider {
    static var previews: some View {
        DeckCard(deck: Deck.mockDecks[0])
    }
}

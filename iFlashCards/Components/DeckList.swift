//
//  DeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckList: View {
    var decks: [Deck]
    
    var body: some View {
        VStack {            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(decks) { deck in
                    NavigationLink(destination: DeckView(currentDeck: deck, deck: deck)) {
                        DeckCard(deck: deck)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct DeckList_Previews: PreviewProvider {
    static var previews: some View {
        DeckList(decks: Deck.mockDecks)
    }
}

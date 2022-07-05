//
//  DeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckList: View {
    @Environment(\.isSearching) var isSearching
    @EnvironmentObject var store: DecksDataStore
    var decks: [Deck]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                if isSearching {
                    if store.filteredDecks.count > 0 {
                        ForEach(store.filteredDecks) { filteredDeck in
                            NavigationLink(destination: DeckView(currentDeck: filteredDeck, deck: filteredDeck)) {
                                DeckCard(deckVM: DeckViewModel(deck: filteredDeck))
                            }
                        }
                    }
                } else {
                    ForEach(decks) { deck in
                        NavigationLink(destination: DeckView(currentDeck: deck, deck: deck)) {
                            DeckCard(deckVM: DeckViewModel(deck: deck))
                        }
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

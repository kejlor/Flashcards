//
//  ExploredDeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/07/2022.
//

import SwiftUI

struct ExploredDeckList: View {
    @Environment(\.isSearching) var isSearching
    @ObservedObject private var deckListVM = DeckListViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                if isSearching {
                    if deckListVM.filteredDecks.count > 0 {
                        ForEach(deckListVM.filteredDecks, id: \.deckDocumentId) { filteredDeck in
                            NavigationLink(destination: ExploreDeckFlashcards(deckVM: filteredDeck)) {
                                DeckCard(deckVM: filteredDeck)
                            }
                        }
                    }
                } else {
                    ForEach(deckListVM.decks, id: \.deckDocumentId) { deck in
                        NavigationLink(destination: ExploreDeckFlashcards(deckVM: deck)) {
                            DeckCard(deckVM: deck)
                        }
                    }
                }
            }
            .onAppear {
                deckListVM.getAllDecks()
            }
        }
    }
}

struct ExploredDeckList_Previews: PreviewProvider {
    static var previews: some View {
        ExploredDeckList()
    }
}

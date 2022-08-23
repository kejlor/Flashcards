//
//  ExploredDeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/07/2022.
//

import SwiftUI

struct ExploredDeckList: View {
    @Environment(\.isSearching) var isSearchingDecks
    @ObservedObject private var deckListVM = DeckListViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                if isSearchingDecks {
                    if deckListVM.filteredDecks.count > 0 {
                        ForEach(deckListVM.filteredDecks) { filteredDeck in
                            NavigationLink(destination: ExploreDeckFlashcards(deckVM: DeckViewModel(deck: filteredDeck))) {
                                DeckCard(deckVM: DeckViewModel(deck: filteredDeck))
                            }
                        }
                        
//                        ForEach(0..<deckListVM.filteredDecks.count, id: \.self) { num in
//                            NavigationLink(destination: ExploreDeckFlashcards(deckVM: DeckViewModel(deck: deckListVM.filteredDecks[num]))) {
//                                DeckCard(deckVM: DeckViewModel(deck: deckListVM.filteredDecks[num]))
//                            }
//                        }
                    }
                } else {
                    ForEach(deckListVM.decks) { deck in
                        NavigationLink(destination: ExploreDeckFlashcards(deckVM: DeckViewModel(deck: deck))) {
                            DeckCard(deckVM: DeckViewModel(deck: deck))
                        }
                    }
                }
            }
        }
    }
}

struct ExploredDeckList_Previews: PreviewProvider {
    static var previews: some View {
        ExploredDeckList()
    }
}

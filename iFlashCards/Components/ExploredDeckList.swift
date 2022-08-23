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
    @Binding var filteredDecks: [Deck]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                if isSearchingDecks {
                    ForEach(filteredDecks, id: \.id) { filteredDeck in
                        NavigationLink(destination: ExploreDeckFlashcards(deckVM: DeckViewModel(deck: filteredDeck))) {
                            DeckCard(deckVM: DeckViewModel(deck: filteredDeck))
                        }
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

//struct ExploredDeckList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExploredDeckList()
//    }
//}

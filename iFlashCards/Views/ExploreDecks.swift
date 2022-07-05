//
//  ExploreDecks.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import SwiftUI

struct ExploreDecks: View {
    @Environment(\.isSearching) var isSearching
    @ObservedObject private var deckListVM = DeckListViewModel()
    
    var body: some View {
        VStack {
            NavigationView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    //                if isSearching {
                    //                    if deckListVM.filteredDecks.count > 0 {
                    //                        ForEach(deckListVM.filteredDecks) { filteredDeck in
                    //                            NavigationLink(destination: DeckView(currentDeck: filteredDeck, deck: filteredDeck)) {
                    //                                DeckCard(deck: filteredDeck)
                    //                            }
                    //                        }
                    //                    }
                    //                } else {
                    ForEach(deckListVM.decks, id: \.deckDocumentId) { deck in
                        NavigationLink(destination: ExploreDeckFlashcards(deckVM: deck)) {
                            DeckCard(deckVM: deck)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .onAppear {
            deckListVM.getAllDecks()
        }
        .navigationTitle("Przeglądaj talie")
        .padding(.horizontal)
    }
}

struct ExploreDecks_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDecks()
    }
}

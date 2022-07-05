//
//  ExploredDeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/07/2022.
//

import SwiftUI

struct ExploredDeckList: View {
    @ObservedObject private var deckListVM = DeckListViewModel()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
            ForEach(deckListVM.decks, id: \.deckDocumentId) { deck in
                NavigationLink(destination: ExploreDeckFlashcards(deckVM: deck)) {
                    DeckCard(deckVM: deck)
                }
            }
        }
        .onAppear {
            deckListVM.getAllDecks()
        }
    }
}

struct ExploredDeckList_Previews: PreviewProvider {
    static var previews: some View {
        ExploredDeckList()
    }
}

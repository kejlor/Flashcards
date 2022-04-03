//
//  DeckViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

final class DeckViewModel: ObservableObject {
    // czy potrzebne?
    
    let store: DecksDataStore
    
    @Published var title = ""
    @Published var decks: [Deck]
    @Published var foregroundText = ""
    @Published var backgroundText = ""
    
    init(store: DecksDataStore) {
        self.store = store
        self.decks = store.decks
    }
    
    func addDeck() {
        store.createDeck(title: title, flashcards: [Flashcard]())
    }
}

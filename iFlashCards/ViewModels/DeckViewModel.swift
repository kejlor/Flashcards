//
//  DeckViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import Foundation

struct DeckViewModel {
    let deck: Deck
    
    var deckDocumentId: String {
        deck.documentId
    }
    
    var title: String {
        deck.title
    }
    
    var flashcards: [Flashcard] {
        deck.flashcards
    }
}

//
//  DeckFlashcardViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 09/07/2022.
//

import Foundation

class DeckFlashcardViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var flashcards: [Flashcard] = []
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func changeFlashcards(deck: Deck) {
        firestoreManager.changeFlashcards(deckId: deck.documentId, flashcards: deck.flashcards)
    }
}

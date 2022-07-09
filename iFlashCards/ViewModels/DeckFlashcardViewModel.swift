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
    
//    func addFlashcardToDeck(deckId: String, flashcard: Flashcard, completion: @escaping (Error?) -> Void) {
//        firestoreManager.updateDeck(deckId: deckId, flashcard: flashcard) { result in
//            switch result {
//            case .success(_):
//                completion(nil)
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
    
    func changeFlashcards(deck: Deck) {
        firestoreManager.changeFlashcards(deckId: deck.documentId, flashcards: deck.flashcards)
    }
}

//
//  DeckListViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager {
    private var db: Firestore
    private var store: DecksDataStore
    
    init() {
        db = Firestore.firestore()
        store = DecksDataStore()
    }
    
//    func getAllDecks(completion: @escaping (Result<[Deck]?, Error>) -> Void) {
//        db.collection("decks")
//            .getDocuments { (snapshot, error) in
//                if let error = error {
//                    completion(.failure(error))
//                } else {
//                    if let snapshot = snapshot {
//                        let decks: [Deck]? = snapshot.documents.compactMap { doc in
//                            var deck = try? doc.data(as: Deck.self)
//                            if deck != nil {
//                                deck!.documentId = doc.documentID
//                            }
//                            return deck
//                        }
//                        completion(.success(decks))
//                    }
//                }
//            }
//    }
    
//    func getDeckFlashcardsBy(deckId: String, completion: @escaping (Result<[Flashcard]?, Error>) -> Void) {
//        db.collection("decks")
//            .document(deckId)
//            .collection("flashcards")
//            .getDocuments { (snapshot, error) in
//                if let error = error {
//                    completion(.failure(error))
//                } else {
//                    if let snapshot = snapshot {
//                        let items: [Flashcard]? = snapshot.documents.compactMap { doc in
//                            var flashcard = try? doc.data(as: Flashcard.self)
//                            flashcard?.documentId = doc.documentID
//                            return flashcard
//                        }
//                        
//                        completion(.success(items))
//                    }
//                }
//            }
//    }
    
    func save(deck: Deck, completion: @escaping (Result<Deck, Error>) -> Void) {
        do {
            let ref = try db.collection("decks").addDocument(from: deck)
            ref.getDocument { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    completion(.failure(error!))
                    return
                }
                var deck = try? snapshot.data(as: Deck.self)
                deck!.documentId = ref.documentID
                deck!.isAdded = true
                self.store.updateDeck(deck: deck!)
                completion(.success(deck!))
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getDeckById(deckId: String, completion: @escaping (Result<Deck?, Error>) -> Void) {
        let ref = db.collection("decks").document(deckId)
        ref.getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                if let snapshot = snapshot {
                    var deck: Deck? = try? snapshot.data(as: Deck.self)
                    if deck != nil {
                        deck!.documentId = snapshot.documentID
                        completion(.success(deck))
                    }
                }
            }
        }
    }
    
    func updateDeck(deckId: String, flashcard: Flashcard, completion: (Result<Deck?, Error>) -> Void) {
        do {
            let _ = try db.collection("decks")
                .document(deckId)
                .collection("flashcards").addDocument(from: flashcard)
            
        } catch let error {
            completion(.failure(error))
        }
    }
}
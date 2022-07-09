//
//  DeckListViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DeckListViewModel: ObservableObject {
    let db = Firestore.firestore()
    private var firestoreManager: FirestoreManager
    @Published var decks: [DeckViewModel] = []
    @Published var filteredDecks: [DeckViewModel] = []
    
    init() {
        firestoreManager = FirestoreManager()
        DispatchQueue.main.async {
            self.getAllDecks()
        }
    }
    
    func getAllDecks() {
        db.collection("decks")
            .getDocuments { [weak self] (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                        if let snapshot = snapshot {
                            let decks: [DeckViewModel] = snapshot.documents.compactMap { doc in
                                var deck = try? doc.data(as: Deck.self)
                                deck?.documentId = doc.documentID
                                if let deck = deck {
                                    return DeckViewModel(deck: deck)
                                }
                                return nil
                            }
                        
                        DispatchQueue.main.async {
                            self?.decks = decks
                        }
                    }
                }
            }
    }
    
    func filteredDecks(for text: String) {
        filteredDecks = []
        let searchText = text.lowercased()
        
//        decks.forEach { deck in
//            let searchContent = deck.deck.title
//            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
//                filteredDecks.append(deck)
//            }
//        }
        
        decks.forEach { deckVM in
            let searchContent = deckVM.title
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredDecks.append(deckVM)
            }
        }
    }
}

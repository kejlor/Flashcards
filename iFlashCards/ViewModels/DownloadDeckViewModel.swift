//
//  DownloadDeckViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import Foundation

class DownloadDeckViewModel: ObservableObject {
    private var store: DecksDataStore
    private var firestoreManager: FirestoreManager
    @Published var downloaded = false
    @Published var message = ""
    
    init() {
        firestoreManager = FirestoreManager()
        store = DecksDataStore()
    }
    
    func downloadDeck(deckVM: DeckViewModel) {
        firestoreManager.getDeckById(deckId: deckVM.deckDocumentId) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.store.createDeck(title: deckVM.title, flashcards: deckVM.flashcards)
                    self.downloaded = true
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.message = "Error while downloading deck"
                }
            }
        }
    }
}

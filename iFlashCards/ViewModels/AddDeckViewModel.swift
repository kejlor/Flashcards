//
//  AddDeckViewModel.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import Foundation

class AddDeckViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var saved = false
    @Published var message = ""
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func save(deck: Deck) {
        firestoreManager.save(deck: deck) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.saved = true
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.message = "Error while saving deck"
                }
            }
        }
    }
}

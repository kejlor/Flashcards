//
//  DecksDataStore.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

final class DecksDataStore: ObservableObject {
    @Published var decks = [Deck]()
    
    init() {
        loadDecks()
    }
    
    private func loadDecks() {
        do {
            let data = try FileManager().readFile()
            decks = try JSONDecoder().decode([Deck].self, from: data)
        } catch {
            print("Error while fetching JSON: \(error)")
        }
    }
    
    func saveDecks() {
        do {
            let data = try JSONEncoder().encode(decks)
            let jsonString = String(decoding: data, as: UTF8.self)
            try FileManager().saveFile(contents: jsonString)
            loadDecks()
        } catch {
            print("Error while fetching JSON: \(error)")
        }
    }
    
    func createDeck(title: String, flashcards: [Flashcard]) {
        let newDeck = Deck(title: title, flashcards: flashcards)
        
        decks.append(newDeck)
        saveDecks()
    }
    
    func updateDeck(deck: Deck) {
        guard let index = selectedDeckIndex(deck: deck) else { return }
        decks[index] = deck
        saveDecks()
    }

    func deleteDeck(deck: Deck) {
        guard let index = selectedDeckIndex(deck: deck) else { return }
        decks.remove(at: index)
        saveDecks()
    }
    
    func addMockFlashcard(deck: Deck) {
        let newFlashcard = Flashcard(foregroundText: "pepe", backgroundText: "zaba")
        guard let index = selectedDeckIndex(deck: deck) else { return  }
        
        decks[index].flashcards.append(newFlashcard)
        saveDecks()
        loadDecks()
    }
    
    private func selectedDeckIndex(deck: Deck) -> Int? {
        guard let index = decks.firstIndex(where: { $0.id == deck.id }) else { return nil }
        return index
    }
}

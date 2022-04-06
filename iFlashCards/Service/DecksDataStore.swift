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
    
    func addNewFlashcard(deck: Deck, foregroundText: String, backgroundText: String) {
        let newFlashcard = Flashcard(foregroundText: foregroundText, backgroundText: backgroundText)
        guard let index = selectedDeckIndex(deck: deck) else { return }
        
        decks[index].flashcards.append(newFlashcard)
        saveDecks()
        loadDecks()
    }
    
    func updateFlashcard(deck: Deck, flashcard: Flashcard, foregroundText: String, backgroundText: String) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        decks[deckIndex].flashcards[flashcardIndex].foregroundText = foregroundText
        decks[deckIndex].flashcards[flashcardIndex].backgroundText = backgroundText
        saveDecks()
        loadDecks()
    }
    
    func correctFlashcardAnswer(deck: Deck, flashcard: Flashcard) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        decks[deckIndex].flashcards[flashcardIndex].wrongAnswer -= 1
        saveDecks()
    }
    
    func wrongFlashcardAnswer(deck: Deck, flashcard: Flashcard) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        decks[deckIndex].flashcards[flashcardIndex].wrongAnswer += 1
        saveDecks()
    }
    
    func sortFlashcards(deck: Deck) -> [Flashcard]? {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return nil }
        let sortedFlaschards = decks[deckIndex].flashcards.sorted { $0.wrongAnswer > $1.wrongAnswer }
        
        return sortedFlaschards
    }
    
    func deleteFlashcard(deck: Deck, flashcard: Flashcard) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        decks[deckIndex].flashcards.remove(at: flashcardIndex)
        saveDecks()
    }
    
    private func selectedDeckIndex(deck: Deck) -> Int? {
        guard let index = decks.firstIndex(where: { $0.id == deck.id }) else { return nil }
        return index
    }
    
    private func selectedFlashcardIndex(deck: Deck, flashcard: Flashcard) -> Int? {
        guard let index = deck.flashcards.firstIndex(where: { $0.id == flashcard.id }) else { return nil }
        return index
    }
}

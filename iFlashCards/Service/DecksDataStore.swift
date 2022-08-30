//
//  DecksDataStore.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

final class DecksDataStore: ObservableObject {
    @Published public private(set) var decks: [Deck] = []
    @Published public private(set) var filteredDecks: [Deck] = []
    @Published public private(set) var filteredFlashcards: [Flashcard] = []
    
    init() {
        loadDecks()
    }
    
    func loadDecks() {
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
    
    func setDeckId(deck: Deck, documentId: String) {
        guard let index = selectedDeckIndex(deck: deck) else { return }
        decks[index].documentId = documentId
        decks[index].isAdded = true
        saveDecks()
    }
    
    func deleteDeck(deck: Deck) {
        guard let index = selectedDeckIndex(deck: deck) else { return }
        decks.remove(at: index)
        saveDecks()
    }
    
    func addNewFlashcard(deck: Deck, foregroundText: String, backgroundText: String) {
        let newFlashcard = Flashcard(foregroundText: foregroundText, backgroundText: backgroundText, wrongAnswers: 0)
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
        
        decks[deckIndex].flashcards[flashcardIndex].wrongAnswers -= 1
        saveDecks()
    }
    
    func wrongFlashcardAnswer(deck: Deck, flashcard: Flashcard) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        if (decks[deckIndex].flashcards[flashcardIndex].wrongAnswers >= 20) {
            decks[deckIndex].flashcards[flashcardIndex].wrongAnswers -= Int.random(in: 1...10)
        }
        
        decks[deckIndex].flashcards[flashcardIndex].wrongAnswers += 1
        saveDecks()
    }
    
    func sortFlashcards(deck: Deck) -> [Flashcard]? {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return nil }
        let sortedFlaschards = decks[deckIndex].flashcards.sorted { $0.wrongAnswers > $1.wrongAnswers }
        
        return sortedFlaschards
    }
        
    func deleteFlashcard(deck: Deck, flashcard: Flashcard) {
        guard let deckIndex = selectedDeckIndex(deck: deck) else { return }
        guard let flashcardIndex = selectedFlashcardIndex(deck: deck, flashcard: flashcard) else { return }
        
        decks[deckIndex].flashcards.remove(at: flashcardIndex)
        saveDecks()
    }
    
    func filteredDecks(for text: String) {
        filteredDecks = []
        let searchText = text.lowercased()
        
        decks.forEach { deck in
            let searchContent = deck.title
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredDecks.append(deck)
            }
        }
    }
    
    func filteredFlashcards(flashcards: [Flashcard], for text: String) {
        filteredFlashcards = []
        let searchText = text.lowercased()
        
        flashcards.forEach { flashcard in
            let searchContent = flashcard.foregroundText
            let secondSearchContent = flashcard.backgroundText
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredFlashcards.append(flashcard)
            }
            if secondSearchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredFlashcards.append(flashcard)
            }
        }
    }
    
    private func selectedDeckIndex(deck: Deck) -> Int? {
        guard let index = decks.firstIndex(where: { $0.id == deck.id }) else { return nil }
        return index
    }
    
    func searchedDeckByTitle(title: String) -> Deck? {
        guard let deck = decks.first(where: { $0.title == title }) else { return nil }
        return deck
    }
    
    private func selectedFlashcardIndex(deck: Deck, flashcard: Flashcard) -> Int? {
        guard let index = deck.flashcards.firstIndex(where: { $0.id == flashcard.id }) else { return nil }
        return index
    }
}

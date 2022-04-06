//
//  Deck.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

struct Deck: Identifiable, Codable {
    var id = UUID().uuidString
    var title: String
    var flashcards: [Flashcard]
}

struct Flashcard: Identifiable, Codable, Hashable {
    
    var id = UUID().uuidString
    var foregroundText: String
    var backgroundText: String
    var wrongAnswer: Int = 0
}

extension Deck {
    static var mockDecks: [Deck] {
        [
            Deck(
                title: "Angielski",
                flashcards: [
                    Flashcard(foregroundText: "Apple", backgroundText: "Jabłko"),
                    Flashcard(foregroundText: "Car", backgroundText: "Samochód"),
                    Flashcard(foregroundText: "Football", backgroundText: "Piłka nożna")
                ]),
            Deck(
                title: "Niemiecki",
                flashcards: [
                    Flashcard(foregroundText: "Hund", backgroundText: "Pies"),
                    Flashcard(foregroundText: "Katzen", backgroundText: "Koty"),
                    Flashcard(foregroundText: "Zeit", backgroundText: "Czas")
                ])
        ]
    }
}

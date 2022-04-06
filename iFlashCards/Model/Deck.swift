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
                    Flashcard(foregroundText: "Apple", backgroundText: "Jabłko", wrongAnswer: 0),
                    Flashcard(foregroundText: "Car", backgroundText: "Samochód", wrongAnswer: 1),
                    Flashcard(foregroundText: "Football", backgroundText: "Piłka nożna", wrongAnswer: 2)
                ]),
            Deck(
                title: "Niemiecki",
                flashcards: [
                    Flashcard(foregroundText: "Hund", backgroundText: "Pies", wrongAnswer: 2),
                    Flashcard(foregroundText: "Katzen", backgroundText: "Koty", wrongAnswer: 3),
                    Flashcard(foregroundText: "Zeit", backgroundText: "Czas", wrongAnswer: 0)
                ])
        ]
    }
}

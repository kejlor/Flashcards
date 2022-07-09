//
//  Deck.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

struct Deck: Identifiable, Codable {
    var isAdded = false
    var documentId = ""
    var id = UUID().uuidString
    var title: String
    var flashcards: [Flashcard]
}

struct Flashcard: Identifiable, Codable, Hashable {
    var documentId = ""
    var id = UUID().uuidString
    var foregroundText: String
    var backgroundText: String
    var wrongAnswers: Int = 0
}

extension Deck {
    static var mockDecks: [Deck] {
        [
            Deck(
                documentId: "123", title: "Angielski",
                flashcards: [
                    Flashcard(foregroundText: "Apple", backgroundText: "Jabłko", wrongAnswers: 0),
                    Flashcard(foregroundText: "Car", backgroundText: "Samochód", wrongAnswers: 1),
                    Flashcard(foregroundText: "Football", backgroundText: "Piłka nożna", wrongAnswers: 2)
                ]),
            Deck(
                documentId: "124", title: "Niemiecki",
                flashcards: [
                    Flashcard(foregroundText: "Hund", backgroundText: "Pies", wrongAnswers: 2),
                    Flashcard(foregroundText: "Katzen", backgroundText: "Koty", wrongAnswers: 3),
                    Flashcard(foregroundText: "Zeit", backgroundText: "Czas", wrongAnswers: 0)
                ])
        ]
    }
}

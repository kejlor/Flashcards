//
//  DeckRevisionView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct DeckRevisionView: View {
    @EnvironmentObject var store: DecksDataStore
    @State private var isFlipped = false
    @State private var currentFlashcard = 0
    var deck: Deck
    var sortedFlashcards: [Flashcard]
    
    var body: some View {
        VStack {
            Text(deck.title)
                .font(.title)
            
            Spacer()
            
            ZStack {
                Card()
                Text(isFlipped ? sortedFlashcards[currentFlashcard].foregroundText : sortedFlashcards[currentFlashcard].backgroundText)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "checkmark.circle")
                }

                Button {
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .rotationEffect(.degrees(310))
                }
            }
            .opacity(isFlipped ? 1 : 0)
            
            Button {
                moveToTheNextFlashcard()
            } label: {
                Text(isFlipped ? "Pokaż kolejną" : "Obróć fiszke")
            }

            Spacer()
        }
    }
}

struct DeckRevisionView_Previews: PreviewProvider {
    static var previews: some View {
//        zmienic drugi argument
        DeckRevisionView(deck: Deck.mockDecks[0], sortedFlashcards: Deck.mockDecks[0].flashcards)
    }
}

extension DeckRevisionView {
    func moveToTheNextFlashcard() {
        if (isFlipped) {
            guard currentFlashcard + 1 < sortedFlashcards.count else { return }
            currentFlashcard += 1
            isFlipped.toggle()
        } else {
            isFlipped.toggle()
        }
    }
}

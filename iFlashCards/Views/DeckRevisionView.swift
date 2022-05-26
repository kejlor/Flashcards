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
    @State var sortedFlashcards: [Flashcard]
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Text(deck.title)
                    .font(.title)
                
                Spacer()
                
                FlashcardRevision(axis: (0,0,1), isFlipped: isFlipped, flashcard: sortedFlashcards[currentFlashcard])
                    .animation( .linear(duration: 1.0))
                HStack {
                    Button {
                        store.correctFlashcardAnswer(deck: deck, flashcard: sortedFlashcards[currentFlashcard])
                        moveToTheNextFlashcard()
                        checkAmount()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 45))
                            .foregroundColor(Color.green)
                    }
                    
                    Button {
                        store.wrongFlashcardAnswer(deck: deck, flashcard: sortedFlashcards[currentFlashcard])
                        moveToTheNextFlashcard()
                        checkAmount()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 45))
                            .foregroundColor(Color.red)
                            .rotationEffect(.degrees(315))
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
            
            if showAlert {
                RevisionAlertView(isShowingAlert: $showAlert)
            }
        }
        .font(.largeTitle)
    }
}

struct DeckRevisionView_Previews: PreviewProvider {
    static var previews: some View {
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
    
    func checkAmount() {
        if currentFlashcard == sortedFlashcards.count - 1 && isFlipped {
            store.saveDecks()
            showAlert = true
        }
    }
}

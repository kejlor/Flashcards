//
//  EditFlashcardView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct EditFlashcardView: View {
    @EnvironmentObject var store: DecksDataStore
    @Binding var isEditing: Bool
    @Binding var flashcard: Flashcard
    var deck: Deck
    
    var body: some View {
        VStack {
            Text("Edytuj tekst z przodu")
            TextField("Dodaj tekst z przodu", text: $flashcard.foregroundText)
                .multilineTextAlignment(.center)
            Text("Edytuj tekst z tyłu")
            TextField("Dodaj tekst z tyłu", text: $flashcard.backgroundText)
                .multilineTextAlignment(.center)
            
            Button {
                store.updateFlashcard(deck: deck, flashcard: flashcard, foregroundText: flashcard.foregroundText, backgroundText: flashcard.backgroundText)
                isEditing = false
            } label: {
                Text("Zapisz zmiany")
            }
            
        }
    }
}

struct EditFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        EditFlashcardView(isEditing: .constant(true), flashcard: .constant(Flashcard(foregroundText: "Dog", backgroundText: "Pies", wrongAnswer: 0)), deck: Deck.mockDecks[0])
    }
}

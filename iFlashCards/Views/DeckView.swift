//
//  DeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var store: DecksDataStore
    var deck: Deck
    
    // do przerobienia
    
    var body: some View {
        VStack {
            Text(deck.title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            if (deck.flashcards.isEmpty) {
                Button {
                    store.addMockFlashcard(deck: deck)
                } label: {
                    Text("Dodaj fiszke")
                }

            } else {
                ScrollView {
                    ForEach(deck.flashcards, id: \.self) { flashcard in
                        Text(flashcard.foregroundText)
                        Divider()
                        Text(flashcard.backgroundText)
                    }
                }
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.mockDecks[0])
    }
}

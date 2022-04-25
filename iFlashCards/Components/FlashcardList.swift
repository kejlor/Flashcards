//
//  FlashcardList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct FlashcardList: View {
    var deck: Deck
    var flashcards: [Flashcard]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
            ForEach(flashcards) { flashcard in
                NavigationLink(destination: FlashcardView(flashcard: flashcard, deck: deck)) {
                    FlashcardCard(flashcard: flashcard)
                }
            }
        }
        .padding(.top)
    }
}

struct FlashCardList_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardList(deck: Deck.mockDecks[0], flashcards: Deck.mockDecks[0].flashcards)
    }
}

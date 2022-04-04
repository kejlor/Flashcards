//
//  FlashcardList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct FlashcardList: View {
    var flashcards: [Flashcard]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(flashcards) { flashcard in
                    NavigationLink(destination: FlashcardView(flashcard: flashcard)) {
                        FlashcardCard(flashcard: flashcard)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct FlashCardList_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardList(flashcards: Deck.mockDecks[0].flashcards)
    }
}

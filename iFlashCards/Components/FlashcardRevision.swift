//
//  FlashcardRevision.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 06/04/2022.
//

import SwiftUI

struct FlashcardRevision: View {
    var axis:(CGFloat,CGFloat,CGFloat) = (1.0,0.0,0.0)
    var isFlipped: Bool
    var flashcard: Flashcard
    
    var body: some View {
        ZStack {
            Card()
            
            if isFlipped {
                Text(flashcard.foregroundText)
            } else {
                Text(flashcard.backgroundText)
                    .rotationEffect(Angle(degrees: 180))
            }
        }
        .rotation3DEffect(Angle.degrees(isFlipped ? 0 : 180), axis: axis)
        .frame(width: 175, height: 220)
    }
}

struct FlashcardRevision_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardRevision(isFlipped: false, flashcard: Deck.mockDecks[0].flashcards[0])
    }
}

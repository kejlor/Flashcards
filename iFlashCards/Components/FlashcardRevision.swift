//
//  FlashcardRevision.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 06/04/2022.
//

import SwiftUI

struct FlashcardRevision: View {
    @Environment(\.colorScheme) var colorScheme
    var axis:(CGFloat,CGFloat,CGFloat) = (1.0,0.0,0.0)
    var isFlipped: Bool
    var flashcard: Flashcard
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    CardRevision()
                    
                    Group {
                        if isFlipped {
                            Text(flashcard.foregroundText)
                                .multilineTextAlignment(.center)
                        } else {
                            Text(flashcard.backgroundText)
                                .multilineTextAlignment(.center)
                                .rotationEffect(Angle(degrees: 180))
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding()
                    .padding(.horizontal)
                }
                .rotation3DEffect(Angle.degrees(isFlipped ? 0 : 180), axis: axis)
            }
        }
    }
}

struct FlashcardRevision_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardRevision(isFlipped: false, flashcard: Deck.mockDecks[0].flashcards[0])
    }
}

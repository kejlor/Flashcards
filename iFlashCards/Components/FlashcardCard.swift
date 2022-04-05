//
//  FlashcardCard.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct FlashcardCard: View {
    var flashcard: Flashcard
    
    var body: some View {
        ZStack {
            Card()
            
            VStack {
                Text(flashcard.foregroundText)
                    .padding()
                
                Divider()
                
                Text(flashcard.backgroundText)
                    .padding()
            }
            .padding()
        }
        .frame(width: 180)
    }
}

struct FlashcardCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardCard(flashcard: Flashcard(foregroundText: "Dog", backgroundText: "Pies"))
    }
}

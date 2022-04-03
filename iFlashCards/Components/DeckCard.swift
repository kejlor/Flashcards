//
//  DeckCard.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckCard: View {
    var deck: Deck
    
    var body: some View {
        ScrollView {
            VStack {
                Text(deck.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct DeckCard_Previews: PreviewProvider {
    static var previews: some View {
        DeckCard(deck: Deck.mockDecks[0])
    }
}

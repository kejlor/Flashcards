//
//  DeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckList: View {
    var decks: [Deck]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(decks.count) \(decks.count > 1 ? "Talie" : "Talia")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(decks) { deck in
                    NavigationLink(destination: DeckView(deck: deck)) {
                        DeckCard(deck: deck)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct DeckList_Previews: PreviewProvider {
    static var previews: some View {
        DeckList(decks: Deck.mockDecks)
    }
}

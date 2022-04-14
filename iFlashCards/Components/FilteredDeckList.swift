//
//  FilteredDeckList.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 14/04/2022.
//

import SwiftUI

struct FilteredDeckList: View {
    @EnvironmentObject var store: DecksDataStore
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(store.filteredDecks) { deck in
                    NavigationLink(destination: DeckView(currentDeck: deck, deck: deck)) {
                        DeckCard(deck: deck)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct FilteredDeckList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDeckList()
    }
}

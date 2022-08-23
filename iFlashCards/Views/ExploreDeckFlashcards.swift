//
//  ExploreDeckFlashcards.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import SwiftUI

struct ExploreDeckFlashcards: View {
    @StateObject private var downloadDeckVM = DownloadDeckViewModel()
    let deckVM: DeckViewModel
    
    var body: some View {
        VStack {
            Text(deckVM.title)
                .font(.title)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(deckVM.flashcards) { flashcard in
                    FlashcardCard(flashcard: flashcard)
                }
            }
            
            CustomButton(text: "Pobierz") {
                downloadDeckVM.downloadDeck(deckVM: deckVM)
            }
        }
    }
}

struct ExploreDeckFlashcards_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDeckFlashcards(deckVM: DeckViewModel(deck: Deck.mockDecks[0]))
    }
}

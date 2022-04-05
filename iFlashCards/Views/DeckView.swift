//
//  DeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var store: DecksDataStore
    @State private var isAdding = false
    var deck: Deck
        
    var body: some View {
//        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    HStack {
                        Text(deck.title)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                    
                    if (deck.flashcards.isEmpty) {
                        Button {
                            isAdding.toggle()
                        } label: {
                            Text("Dodaj fiszke")
                        }
                    } else {
                        ScrollView {
                            FlashcardList(deck: deck, flashcards: deck.flashcards)
                        }
                    }
                    
                    Button {
                        store.deleteDeck(deck: deck)
                    } label: {
                        Text("Usuń talie")
                    }
                }
            }
//        }
        .navigationBarItems(trailing: Button(action: {
            isAdding.toggle()
        }, label: {
            Text("Dodaj")
        }))
        .sheet(isPresented: $isAdding) {
            AddFlashcardView(isAdding: $isAdding, deck: deck)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.mockDecks[0])
    }
}

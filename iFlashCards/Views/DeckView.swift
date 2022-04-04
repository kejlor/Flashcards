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
    
    // do przerobienia
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    Text(deck.title)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    if (deck.flashcards.isEmpty) {
                        Button {
                            store.addMockFlashcard(deck: deck)
                        } label: {
                            Text("Dodaj fiszke")
                        }
                    } else {
                        FlashcardList(flashcards: deck.flashcards)
                    }
                }
            }
        }
//        .navigationBarItems(trailing: Button(action: {
//            isAdding.toggle()
//        }, label: {
//            Text("Edit".uppercased())
//        }))
//        .sheet(isPresented: $isAdding, content: AddFlashcardView(isAdding: $isAdding, deck: deck))
        .navigationBarItems(trailing: Button(action: {
            isAdding.toggle()
        }, label: {
            Text("Dodaj".uppercased())
        }))
        .sheet(isPresented: $isAdding) {
            AddFlashcardView(isAdding: $isAdding, deck: deck)
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.mockDecks[0])
    }
}

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
    @State private var isEdditing = false
    @State var deck: Deck
    
    var body: some View {
        
        let binding = Binding(get: { self.deck}, set: { self.deck = $0 })
        
        ZStack(alignment: .center) {
            VStack {
                HStack {
                    Text(deck.title)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Button {
                        isEdditing.toggle()
                    } label: {
                        Image(systemName: "pencil")
                        Text("Edytuj")
                    }
                }
                
                NavigationLink(destination: DeckRevisionView(deck: deck, sortedFlashcards: deck.flashcards)) {
                    Text("Test wiedzy")
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
        .navigationBarItems(trailing: Button(action: {
            isAdding.toggle()
        }, label: {
            Text("Dodaj")
        }))
        .sheet(isPresented: $isAdding) {
            AddFlashcardView(isAdding: $isAdding, deck: deck)
        }
        .sheet(isPresented: $isEdditing, content: {
            EditDeckView(isEditing: $isEdditing, deck: binding)
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.mockDecks[0])
    }
}

//
//  DeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var store: DecksDataStore
    @StateObject private var deckFlashVM = DeckFlashcardViewModel()
    @State private var isAdding = false
    @State private var isEdditing = false
    @State var currentDeck: Deck
    @State private var text = ""
    var deck: Deck
    
    var body: some View {
        let binding = Binding(get: { self.currentDeck}, set: { self.currentDeck = $0 })
        
        ZStack(alignment: .center) {
            VStack {
                HStack {
                    Text(currentDeck.title)
                        .font(.largeTitle)
                        .bold()
                        .lineLimit(1)
                    
                    Button {
                        isEdditing.toggle()
                    } label: {
                        Image(systemName: "pencil")
                            .font(.largeTitle)
                    }
                }
                
                if (deck.flashcards.isEmpty) {
                    Spacer()
                    
                    CustomButton(text: "Dodaj fiszke") {
                        isAdding.toggle()
                    }
                    
                    Spacer()
                } else {
                    NavigationLink(destination: DeckRevisionView(sortedFlashcards: store.sortFlashcards(deck: deck) ?? [Flashcard(foregroundText: "empty", backgroundText: "empty")], deck: deck)) {
                        Text("Test wiedzy")
                            .fontWeight(.semibold)
                            .padding()
                            .padding(.horizontal, 20)
                            .background(
                                colorScheme == .dark ? Color.white.cornerRadius(10).shadow(radius: 10) : Color.black.cornerRadius(10).shadow(radius: 10)
                            )
                    }
                    
                    ScrollView {
                        FlashcardList(deck: deck, flashcards: deck.flashcards)
                    }
                    .searchable(text: $text, prompt: "Wyszukaj fiszke")
                    .onSubmit(of: .search) {
                        store.filteredFlashcards(flashcards: deck.flashcards, for: text)
                    }
                }
                
                HStack {
                    CustomButton(text: "Usuń talie") {
                        store.deleteDeck(deck: deck)
                    }
                    
                    if (deck.isAdded) {
                        CustomButton(text: "Aktualizuj") {
//                            for flashcard in deck.flashcards {
//                                deckFlashVM.addFlashcardToDeck(deckId: deck.documentId, flashcard: flashcard) { error in
//                                    if let error = error {
//                                        print(error.localizedDescription)
//                                    }
//                                }
//                            }
                            deckFlashVM.changeFlashcards(deck: deck)
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            isAdding.toggle()
        }, label: {
            Text("Dodaj")
        }))
        .sheet(isPresented: $isAdding) {
            AddFlashcardView(isAdding: $isAdding, deck: currentDeck)
        }
        .sheet(isPresented: $isEdditing, content: {
            EditDeckView(isEditing: $isEdditing, deck: binding)
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(currentDeck: Deck.mockDecks[0], deck: Deck.mockDecks[0])
    }
}

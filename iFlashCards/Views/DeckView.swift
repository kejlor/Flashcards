//
//  DeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct DeckView: View {
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
                titleAndEditButtonLayer
                
                if (deck.flashcards.isEmpty) {
                    addFlashcardLayer
                } else {
                    navigationLink
                    flashcardScrollableList
                }
                buttonsLayer
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
    
    var titleAndEditButtonLayer: some View {
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
    }
    
    var addFlashcardLayer: some View {
        VStack {
            Spacer()
            
            Button("Dodaj fiszke") {
                isAdding.toggle()
            }
            .buttonStyle(CustomButton())
            
            Spacer()
        }
    }
    
    var buttonsLayer: some View {
        HStack {
            Button("Usuń talie") {
                store.deleteDeck(deck: deck)
            }
            .buttonStyle(CustomButton())
            
            if (deck.isAdded) {
                Button("Aktualizuj") {
                    deckFlashVM.changeFlashcards(deck: deck)
                }
                .buttonStyle(CustomButton())
            }
        }
    }
    
    var navigationLink: some View {
        NavigationLink(destination: DeckRevisionView(sortedFlashcards: store.sortFlashcards(deck: deck) ?? [Flashcard(foregroundText: "empty", backgroundText: "empty")], deck: deck)) {
            Text("Test wiedzy")
                .padding()
                .padding(.horizontal, 20)
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
    
    var flashcardScrollableList: some View {
        ScrollView {
            FlashcardList(deck: deck, flashcards: deck.flashcards)
        }
        .searchable(text: $text, prompt: "Wyszukaj fiszke")
        .onSubmit(of: .search) {
            store.filteredFlashcards(flashcards: deck.flashcards, for: text)
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(currentDeck: Deck.mockDecks[0], deck: Deck.mockDecks[0])
    }
}

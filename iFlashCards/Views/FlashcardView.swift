//
//  FlashcardView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct FlashcardView: View {
    
    @EnvironmentObject var store: DecksDataStore
    @State var flashcard: Flashcard
    @State private var isEditing = false
    var deck: Deck
    
    var body: some View {
    
        let binding = Binding(get: { self.flashcard}, set: { self.flashcard = $0 })
        
//        NavigationView {
            VStack {
                HStack {
                    FlashcardCard(flashcard: flashcard)
                    Button {
                        isEditing.toggle()
                    } label: {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Edytuj")
                        }
                        .foregroundColor(.black)
                    }   
                }
                
                Button {
                    store.deleteFlashcard(deck: deck, flashcard: flashcard)
                } label: {
                    Text("Usuń fiszke")
                        .foregroundColor(.red)
                }

            }
//        }
        .navigationBarItems(trailing: Button(action: {
            isEditing.toggle()
        }, label: {
            Text("Dodaj".uppercased())
        }))
        .sheet(isPresented: $isEditing) {
            EditFlashcardView(isEditing: $isEditing, flashcard: binding, deck: deck)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(flashcard: Flashcard(foregroundText: "Dog", backgroundText: "Pies"), deck: Deck.mockDecks[0])
    }
}

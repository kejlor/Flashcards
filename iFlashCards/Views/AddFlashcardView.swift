//
//  AddFlashcardView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct AddFlashcardView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: DecksDataStore
    @Binding var isAdding: Bool
    @State private var foregroundText = ""
    @State private var backgroundText = ""
    let deck: Deck
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Text("Tekst z przodu fiszki")
                        TextField("Wprowadź tekst z przodu fiszki", text: $foregroundText)
                        
                        Text("Tekst z tyłu fiszki")
                        TextField("Wprowadź tekst z tyłu fiszki", text: $backgroundText)
                    }
                    
                    Spacer()
                    
                    Button {
                        store.addNewFlashcard(deck: deck, foregroundText: foregroundText, backgroundText: backgroundText)
                    } label: {
                        Text("Dodaj fiszke")
                    }
                }
        }
    }
}

struct AddFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        AddFlashcardView(isAdding: .constant(true), deck: Deck.mockDecks[0])
    }
}

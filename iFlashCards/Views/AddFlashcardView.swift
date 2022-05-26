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
    var deck: Deck
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Pytanie")
            TextField("Wprowadź pytanie", text: $foregroundText)
                .multilineTextAlignment(.center)
            
            Text("Odpowiedź")
            TextField("Wprowadź odpowiedź", text: $backgroundText)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                store.addNewFlashcard(deck: deck, foregroundText: foregroundText, backgroundText: backgroundText)
                isAdding.toggle()
            } label: {
                Text("Dodaj fiszke")
            }
            
            Spacer()
        }
        .font(.largeTitle)
    }
}

struct AddFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        AddFlashcardView(isAdding: .constant(true), deck: Deck.mockDecks[0])
    }
}

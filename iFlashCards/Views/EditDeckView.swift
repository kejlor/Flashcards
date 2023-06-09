//
//  EditDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/04/2022.
//

import SwiftUI

struct EditDeckView: View {
    @EnvironmentObject var store: DecksDataStore
    @Binding var isEditing: Bool
    @Binding var deck: Deck
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Edytuj tytuł")
            TextField("Wpisz nazwę tytułu tali", text: $deck.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Zapisz zmiany") {
                store.updateDeck(deck: deck)
                isEditing.toggle()
            }
            .buttonStyle(CustomButton())
            
            Spacer()
        }
        .padding()
        .font(.largeTitle)
    }
}

struct EditDeckView_Previews: PreviewProvider {
    static var previews: some View {
        EditDeckView(isEditing: .constant(true), deck: .constant(Deck.mockDecks[0]))
    }
}

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
            Text("Edytuj tytuł")
            TextField("Wpisz nazwę tytułu tali", text: $deck.title)
                .multilineTextAlignment(.center)
            
            Button {
                store.updateDeck(deck: deck)
                isEditing.toggle()
            } label: {
                Text("Zapisz zmiany")
            }
            
        }
    }
}

struct EditDeckView_Previews: PreviewProvider {
    static var previews: some View {
        EditDeckView(isEditing: .constant(true), deck: .constant(Deck.mockDecks[0]))
    }
}

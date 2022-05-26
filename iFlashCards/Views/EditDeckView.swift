//
//  EditDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/04/2022.
//

import SwiftUI

struct EditDeckView: View {
    @Environment(\.colorScheme) var colorScheme
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
            
            Button {
                store.updateDeck(deck: deck)
                isEditing.toggle()
            } label: {
                Text("Zapisz zmiany")
                    .fontWeight(.semibold)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        colorScheme == .dark ? Color.white.cornerRadius(10).shadow(radius: 10) : Color.black.cornerRadius(10).shadow(radius: 10)
                    )
            }
            
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

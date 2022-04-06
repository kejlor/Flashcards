//
//  AddDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct AddDeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: DecksDataStore
    @State private var deckTitle = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Tytuł talii")
                TextField("Wprowadź tytuł talii", text: $deckTitle)
            }
            
            Spacer()
            
            
            Button {
                store.createDeck(title: deckTitle, flashcards: [Flashcard]())
                deckTitle = ""
            } label: {
                Text("Dodaj talie")
            }
            .disabled(deckTitle.isEmpty)
            
        }
    }
}

struct AddDeckView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeckView()
    }
}

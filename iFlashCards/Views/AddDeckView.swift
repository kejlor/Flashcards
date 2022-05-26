//
//  AddDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct AddDeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var store: DecksDataStore
    @State private var deckTitle = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Tytuł talii:")
            
            TextField("Wprowadź tytuł talii", text: $deckTitle)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button {
                store.createDeck(title: deckTitle, flashcards: [Flashcard]())
                deckTitle = ""
            } label: {
                Text("Dodaj talie")
                    .fontWeight(.semibold)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        colorScheme == .dark ? Color.white.cornerRadius(10).shadow(radius: 10) : Color.black.cornerRadius(10).shadow(radius: 10)
                    )
            }
            .disabled(deckTitle.isEmpty)
            
            Spacer()
        }
        .font(.largeTitle)
    }
}

struct AddDeckView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeckView()
    }
}

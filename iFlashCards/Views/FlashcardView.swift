//
//  FlashcardView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct FlashcardView: View {
    
    @EnvironmentObject var store: DecksDataStore
    var flashcard: Flashcard
    @State private var foregroundText = ""
    @State private var backgroundText = ""
    
    init(flashcard: Flashcard) {
        self.flashcard = flashcard
        self.foregroundText = flashcard.foregroundText
        self.backgroundText = flashcard.backgroundText
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Tekst z przodu fiszki")
                TextField("Dodaj tekst z przodu fiszki", text: $foregroundText)
                Text("Tekst z tyłu fiszki")
                TextField("Dodaj tekst z tyłu fiszki", text: $foregroundText)
                
                HStack {
                    
                }
            }
//            .navigationTitle("Edytuj fiszkę")
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(flashcard: Flashcard(foregroundText: "Pies", backgroundText: "Dog"))
    }
}

//
//  ExportDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/07/2022.
//

import SwiftUI

struct ExportDeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var deckListVM = DeckListViewModel()
    @EnvironmentObject var store: DecksDataStore
    @StateObject private var addDeckVM = AddDeckViewModel()
    @State private var selectedDeck = ""
    @Binding var isAdding: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Wybierz talie: ")
                    .font(.title)
                
                Picker("Wybierz talię do dodania",  selection: $selectedDeck) {
                    ForEach(store.decks, id: \.title) { deck in
                            Text(deck.title)
                                .font(.title)
                    }
                }
            }

            Text("Wybrana talia: \(selectedDeck)")
                .font(.title)
            
            CustomButton(text: "Wyeksportuj talie") {
                addDeckVM.save(deck: store.searchedDeckByTitle(title: selectedDeck)!)
                isAdding.toggle()
                deckListVM.getAllDecks()
            }
            .disabled(selectedDeck == "")
        }
    }
}

struct ExportDeckView_Previews: PreviewProvider {
    static var previews: some View {
        ExportDeckView(isAdding: .constant(true))
    }
}

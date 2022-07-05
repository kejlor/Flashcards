//
//  ExportDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 05/07/2022.
//

import SwiftUI

struct ExportDeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: DecksDataStore
    @StateObject private var addDeckVM = AddDeckViewModel()
    @State private var selectedDeck = ""
    @Binding var isAdding: Bool
    
    var body: some View {
        VStack {
            Picker("Wybierz talię do dodania",  selection: $selectedDeck) {
                ForEach(store.decks, id: \.title) {
                    Text($0.title)
                }
            }
            
            Text("Wybrana talia: \(selectedDeck)")
            
            Button {
                addDeckVM.save(deck: store.searchedDeckByTitle(title: selectedDeck)!)
                isAdding.toggle()
            } label: {
                Text("Wyeksportuj talie")
            }

        }
    }
}

struct ExportDeckView_Previews: PreviewProvider {
    static var previews: some View {
        ExportDeckView(isAdding: .constant(true))
    }
}

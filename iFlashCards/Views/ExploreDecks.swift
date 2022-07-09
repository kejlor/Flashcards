//
//  ExploreDecks.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import SwiftUI

struct ExploreDecks: View {
    @Environment(\.isSearching) var isSearching
    @EnvironmentObject var store: DecksDataStore
    @StateObject private var addDeckVM = AddDeckViewModel()
    @ObservedObject private var deckListVM = DeckListViewModel()
    @State private var isAdding = false
    @State private var text = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ScrollView {
                        ExploredDeckList()
                    }
                    .searchable(text: $text, prompt: "Wyszukaj talie")
                    .onSubmit(of: .search) {
                        deckListVM.filteredDecks(for: text)
                    }
                    .navigationTitle("Przeglądaj talie")
                }
            }
            
            CustomButton(text: "Dodaj") {
                isAdding.toggle()
            }
        }
        .sheet(isPresented: $isAdding) {
            ExportDeckView(isAdding: $isAdding)
        }
    }
}

struct ExploreDecks_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDecks()
    }
}

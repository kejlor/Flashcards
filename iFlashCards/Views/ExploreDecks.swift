//
//  ExploreDecks.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import SwiftUI

struct ExploreDecks: View {
    @EnvironmentObject var store: DecksDataStore
    @StateObject private var addDeckVM = AddDeckViewModel()
    
    @Environment(\.isSearching) var isSearching
    @ObservedObject private var deckListVM = DeckListViewModel()
    @State private var isAdding = false
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                        ForEach(deckListVM.decks, id: \.deckDocumentId) { deck in
                            NavigationLink(destination: ExploreDeckFlashcards(deckVM: deck)) {
                                DeckCard(deckVM: deck)
                            }
                        }
                    }
                    .onAppear {
                        deckListVM.getAllDecks()
                    }
                }
                .navigationTitle("Przeglądaj talie")
            }
            Button {
                isAdding.toggle()
            } label: {
                Text("dodaj")
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

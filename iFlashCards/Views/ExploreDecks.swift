//
//  ExploreDecks.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/07/2022.
//

import SwiftUI

struct ExploreDecks: View {
    @StateObject private var addDeckVM = AddDeckViewModel()
    @ObservedObject private var deckListVM = DeckListViewModel()
    @State private var isAdding = false
    @State private var text = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ScrollView {
                        ExploredDeckList(filteredDecks: $deckListVM.filteredDecks)
                    }
                    .navigationTitle("Przeglądaj talie")
                }
                .searchable(text: $text, prompt: "Wyszukaj talie")
                .onSubmit(of: .search) {
                    deckListVM.filterDecks(for: text)
                }
            }
            
            Button("Dodaj") {
                isAdding.toggle()
            }
            .buttonStyle(CustomButton())
        }
        .onAppear {
            deckListVM.getAllDecks()
        }
        .sheet(isPresented: $isAdding) {
            ExportDeckView(isAdding: $isAdding)
        }
        .navigationViewStyle(.stack)
    }
}

struct ExploreDecks_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDecks()
    }
}

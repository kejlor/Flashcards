//
//  HomeView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: DecksDataStore
    @State private var text = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    if (store.decks.isEmpty) {
                        Text("Dodaj pierwszą talię!")
                    } else {
                        ScrollView {
                            DeckList(decks: store.decks)
                        }
                        
                    }
                }
                .navigationTitle("Moje talie")
                .searchable(text: $text, prompt: "Wyszukaj talię")
                .onSubmit(of: .search) {
                    store.filteredDecks(for: text)
                }
            }
            .onAppear {
                store.loadDecks()
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

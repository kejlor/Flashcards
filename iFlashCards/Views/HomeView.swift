//
//  HomeView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: DecksDataStore
    
    // do przerobienia
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    if (store.decks.isEmpty) {
                        Text("Dodaj pierwszą talie!")
                    } else {
                        ScrollView {
                            DeckList(decks: store.decks)
                        }
                        .navigationTitle("Moje talie")
                        .foregroundColor(.white)
                    }
                }
                .background(Color("Background"))
            }
            .navigationViewStyle(.stack)
            .foregroundColor(.black)
        }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  NewDeckSheet.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct NewDeckSheet: View {
    // do przerobienia
    
    @State private var showAddDeck = false
    
    var body: some View {
        NavigationView {
            Button("Dodaj talie") {
                showAddDeck = true
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddDeck) {
            AddDeckView()
        }
    }
}

struct NewDeckSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckSheet()
    }
}

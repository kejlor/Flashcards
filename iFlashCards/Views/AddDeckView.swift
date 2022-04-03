//
//  AddDeckView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct AddDeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: DecksDataStore
    @State private var title = ""
    
    // do przerobienia
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tytuł")) {
                    TextField("Nazwa tali", text: $title)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                    ToolbarItem {
                            Button {
                                store.createDeck(title: title, flashcards: [Flashcard]())
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Label("Dodaj", systemImage: "checkmark")
                                    .labelStyle(.iconOnly)
                            }
                            .disabled(title.isEmpty)
                    }
                }
            }
            .navigationTitle("Nowa talia")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddDeckView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeckView()
    }
}

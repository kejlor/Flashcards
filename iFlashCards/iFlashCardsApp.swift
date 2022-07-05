//
//  iFlashCardsApp.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI
import Firebase

@main
struct iFlashCardsApp: App {
    @StateObject private var store = DecksDataStore()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

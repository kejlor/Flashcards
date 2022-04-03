//
//  iFlashCardsApp.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

@main
struct iFlashCardsApp: App {
    @StateObject private var store = DecksDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

//
//  ContentView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .tabItem {
                        Label("Talie", systemImage: "house")
                            .font(.largeTitle)
                    }
                AddDeckView()
                    .tag(1)
                    .tabItem {
                        Label("Dodaj talię", systemImage: "plus")
                    }
                ExploreDecks()
                    .tag(2)
                    .tabItem {
                        Label("Przeszukaj bazę", systemImage: "doc.text.magnifyingglass")
                    }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

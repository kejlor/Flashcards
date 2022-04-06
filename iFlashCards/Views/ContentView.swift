//
//  ContentView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .tabItem {
                        Label("Talie", systemImage: "house")
                    }
                AddDeckView()
                    .tag(1)
                    .tabItem {
                        Label("Dodaj talie", systemImage: "plus")
                    }
            }
        }
//        .background(Color("Gray"))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

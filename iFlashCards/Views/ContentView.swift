//
//  ContentView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                HomeView()
                    .tabItem {
                        Text("Dom")
                    }
                    .tag(0)
                
                NewDeckSheet()
                    .tabItem {
                        Text("Dodaj")
                    }
                    .tag(1)
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

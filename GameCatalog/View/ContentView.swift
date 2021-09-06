//
//  ContentView.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    enum Tab: Int {
        case game
        case search
    }
    @State var selectedTab = Tab.game
    @State private var showAbout = false
    var body: some View {
        NavigationView {
            Group{
        TabView(selection: $selectedTab) {
            HomeView().tabItem {
                tabBarItem(text: "Games", image: "gamecontroller")
            }.tag(Tab.game)
            SearchView().tabItem {
                tabBarItem(text: "Search", image: "magnifyingglass")
            }.tag(0)
        }
            }.navigationBarTitle("Games",displayMode: .automatic)
            .navigationBarItems(trailing: HStack{
                aboutButton
            })
            .sheet(isPresented: $showAbout, content: {
                AboutView()
            })
        }
    }
    private var aboutButton: some View {
        Button(action: {
            showAbout.toggle()
        }, label: {
            HStack {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }.frame(width: 30, height: 30)
        })
    }
    private func tabBarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            
            Text(text)
        }
    }
}



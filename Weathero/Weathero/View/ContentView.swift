//
//  ContentView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var selection = 0
    @StateObject private var heroDB = HeroDatabase(realm: try! Realm())
    var body: some View {
        TabView(selection: $selection) {
            HomeView(selection: $selection)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            StoryView()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Story")
                }
                .tag(2)
            QuizView()
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Quiz")
                }
                .tag(1)
            TestView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Challenge")
                }
                .tag(3)
            SummaryView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Collection")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

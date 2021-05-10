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
                    Image("iconHome")
                    Text("Home")
                }
                .tag(0)
            StoryView()
                .tabItem {
                    Image("iconStory")
                    Text("Story")
                }
                .tag(2)
            QuizView()
                .tabItem {
                    Image("iconQuiz")
                    Text("Quiz")
                }
                .tag(1)
            TestView()
                .tabItem {
                    Image("iconChallenge")
                    Text("Challenge")
                }
                .tag(3)
            SummaryView()
                .tabItem {
                    Image("iconCollection")
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

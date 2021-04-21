//
//  ContentView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            HomeView(selection: $selection)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            QuizView()
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Quiz")
                }
                .tag(1)
            StoryView()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Story")
                }
            SummaryView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Summary")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

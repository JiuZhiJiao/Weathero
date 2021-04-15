//
//  ContentView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            QuizView()
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Quiz")
                }
            TestView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Test")
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

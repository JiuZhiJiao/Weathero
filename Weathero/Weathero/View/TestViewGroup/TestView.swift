//
//  TestView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Finish the test to collect new hero").font(.title2).foregroundColor(.primary).textCase(.none)) {}
                Section(header: Text("Weathero Kat").font(.title2).textCase(.none)) {
                    ZStack {
                        TestCardView(test: tests[0])
                        NavigationLink( destination: TestQuizView(test: tests[0])){}.opacity(0)
                    }
                }
                Section(header: Text("Weathero Steve").font(.title2).textCase(.none)) {
                    ZStack {
                        TestCardView(test: tests[2])
                        NavigationLink( destination: TestQuizView(test: tests[2])){}.opacity(0)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Test")
        }
    }
}


// preview of current view
#if DEBUG
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
#endif

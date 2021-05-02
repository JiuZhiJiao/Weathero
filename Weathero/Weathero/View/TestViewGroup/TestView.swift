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
                Section(header: Text("Weathero Kat").font(.title2).textCase(.none)) {
                    TestCardView(test: tests[0])
                    TestCardView(test: tests[1])
                }
                Section(header: Text("Weathero Steve").font(.title2).textCase(.none)) {
                    TestCardView(test: tests[2])
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

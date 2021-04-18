//
//  TestCardView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI

struct TestCardView: View {
    let test: Test
    var body: some View {
        HStack {
            Image(test.hero.image)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            Spacer()
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading) {
                    Text(test.topic)
                        .font(.title)
                        .bold()
                    Text("Answer questions to collect the hero \(test.hero.name)")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack {
                    ProgressView("Progress:", value: test.process, total: 1.0)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct TestCardView_Previews: PreviewProvider {
    static var previews: some View {
        TestCardView(test: tests[0])
            .previewLayout(.fixed(width: 380, height: 250))
    }
}

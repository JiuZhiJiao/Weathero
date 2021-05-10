//
//  TestCardView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI

struct TestCardView: View {
    let test: Test
    @State private var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            HStack {
                Image(test.hero.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: width * 0.25)
                    .clipShape(Circle())
                Spacer()
                    .frame(width: 32)
                VStack(alignment: .leading) {
                    Text(test.hero.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                        .frame(height: 8)
                    Text(test.topic)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                Spacer()
            }
            VStack {
                Text("Answer 10 questions correctly about \(test.topic) to collect the \(test.hero.name)")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .lineLimit(4)
            }
        }
        .padding(.vertical)
        
    }
}

struct TestCardView_Previews: PreviewProvider {
    static var previews: some View {
        TestCardView(test: tests[0])
            .previewLayout(.fixed(width: 380, height: 250))
    }
}

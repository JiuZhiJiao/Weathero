//
//  SummaryView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Spacer()
                VStack {
                    Text("Collection")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                        .frame(height: 16)
                    Text("Check which heroes you have collected")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        SummaryCardView(hero: heros[0])
                        SummaryCardView(hero: heros[1])
                    }
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        SummaryCardView(hero: heros[2])
                        SummaryCardView(hero: heros[3])
                    }
                }
                .padding()
                
                Spacer()
                
                Text("Weathero Version: 1.0")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .background(Color(red: 242/255, green: 242/255 , blue:247/255).ignoresSafeArea())
    }
}


// preview of current view
#if DEBUG
struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
#endif

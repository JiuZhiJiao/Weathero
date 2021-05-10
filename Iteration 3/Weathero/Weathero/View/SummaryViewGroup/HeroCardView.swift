//
//  HeroCardView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 8/5/21.
//

import SwiftUI

struct HeroCardView: View {
    let hero: HeroData
    @State private var colors:[Color] = [
        Color(red:213/255, green: 140/255, blue: 84/255),
        Color(red:112/255, green: 202/255, blue: 158/255),
        Color(red:161/255, green: 180/255, blue: 48/255),
        Color(red:65/255, green: 105/255, blue: 225/255),
        Color(red:174/255, green: 174/255, blue: 178/255)
    ]
    @State private var width = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Rectangle()
                .fill(hero.collect ? colors[hero.id] : colors[4])
                .ignoresSafeArea()
           
            VStack(spacing: 8) {
                Image(hero.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.25)
                    .opacity(hero.collect ? 1 : 0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 3))
                
                Text(hero.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text(hero.desc)
                    .font(.custom("SF Compact Rounded", size: 15))
                    .lineSpacing(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal)
        }
        .frame(width: width * 0.45, height: width * 0.65)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
#if DEBUG
//struct HeroCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroCardView()
//    }
//}
#endif

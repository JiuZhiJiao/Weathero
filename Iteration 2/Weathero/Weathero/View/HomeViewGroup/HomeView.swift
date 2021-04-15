//
//  HomeView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var selection: Int
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    LoopVideoPlayerView()
                        .scaledToFill()
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    Text("Hi, I am weather your weather hero. I am on mission to save the world from floods and droughts. How about you help me do that?")
                    Text("This is a journey to becaom a weather hero")
                    Text("All you must do is watch a few videos, take a quiz, and get ready to implement it in your daily life. I need you. Come help me!")
                    
                    
                }
                .padding(.init(top: 16, leading: 32, bottom: 0, trailing: 32))
                
                VStack{
                    Button(action: {self.selection = 1}) {
                        Text("Help Me")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Rectangle().fill(Color.blue))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    
                    Spacer()
                        .frame(width: 100, height: 20)
                }
                .padding(.top)
                
                
                
            }
            .navigationTitle("Welcome")
        }
    }
}


// preview of current view
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selection: .constant(0))
    }
}
#endif

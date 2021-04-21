//
//  HomeView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI
//import SwiftUICharts


struct HomeView: View {
    @Binding var selection: Int
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Hi, I am weathero your weather hero. I am on mission to save the world from floods and droughts. How about you help me do that?")
                        .font(.custom("SF Compact Rounded", size: 20))
                        .lineSpacing(3)
                    
                    LoopVideoPlayerView()
                        .scaledToFill()
                        .cornerRadius(10)
                    
                    Text("This is a journey to become a weather hero")
                        .font(.custom("SF Compact Rounded", size: 20))
                        .lineSpacing(3)
                    Text("All you must do is watch a few videos, take a quiz, and get ready to implement it in your daily life. I need you. Come help me!")
                        .font(.custom("SF Compact Rounded", size: 20))
                        .lineSpacing(3)
                    
                }
                .padding(.init(top: 16, leading: 32, bottom: 8, trailing: 32))
                
                HStack(){
                    Spacer()
                    Button(action: {self.selection = 1}) {
//                        Text("Let's Get Started")
//                            .font(.system(.title2, design: .rounded))
//                            .fontWeight(.semibold)
//                            .padding(20)
//                            .background(
//                                Rectangle()
//                                    .fill(Color.white)
//                                    .cornerRadius(60)
//                                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 10, y: 10)
//                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//                            )
                        
                        Text("Let's Get Started")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                            .padding(5)
                            .background(Color.white)
                            .frame(height: 20)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                        
                    }
                    
                }
                .padding(.trailing, 32)
                
                Spacer()
                    .frame(height: 16)
                
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

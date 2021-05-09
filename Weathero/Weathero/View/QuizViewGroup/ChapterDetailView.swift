//
//  ChapterDetailView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI
import AVKit
import RealmSwift

struct ChapterDetailView: View {
    let chapter: Chapter
    private let width = UIScreen.main.bounds.width
    private let controller = AVPlayerViewController()
    
    var body: some View {
        VStack {
            
            LocalVideoPlayerView(videoString: chapter.video, controller: controller)
//                .frame(width: UIScreen.main.bounds.width / 1.15,height: UIScreen.main.bounds.height / 4.42)
                .frame(width: width * 0.88,height: width * 0.495 )
                .cornerRadius(5.0)
                .shadow(radius: 20)
                .onDisappear() {
                    self.controller.player?.pause()
                }
                .padding(.top, 32)
                .padding(.bottom)
//            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    Text("Content")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    Text(chapter.content)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom("SF Compact Rounded", size: 20))
                        .lineSpacing(3)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                
            }
            
            VStack(alignment: .center) {
                NavigationLink(destination: AnswerQuizView(chapter: chapter)) {
//                    Text("Answer Quiz")
//                        .font(.system(.title2, design: .rounded))
//                        .fontWeight(.bold)
//                        .frame(width:200, height: 25)
//                        .foregroundColor(.blue)
//                        .background(Color.white)
//                        .padding(5)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 40)
//                                .stroke(Color.blue, lineWidth: 3)
//                        )
                    Text("Answer Quiz")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            .padding(.bottom, 5)
            //ProgressView(value: 0.6, total: 1.0)
            
        }
        .background(Color(red: 242/255, green: 242/255 , blue:247/255).ignoresSafeArea())
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChapterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailView(chapter: chapters[0])
    }
}

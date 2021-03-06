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
        VStack() {
            LocalVideoPlayerView(videoString: chapter.video, controller: controller)
                .frame(width: width, height: width * 0.56)
                .onDisappear() {
                    self.controller.player?.pause()
                }
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    Text("Content")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    Text(chapter.content)
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
        
        
        
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChapterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailView(chapter: chapters[0])
    }
}

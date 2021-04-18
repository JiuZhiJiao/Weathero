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
        VStack(alignment: .leading) {
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
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                }
                .padding()
                
                VStack(alignment:.center) {
                    NavigationLink(destination: ChapterQuizView(chapter: chapter)) {
                        Text("Answer Quiz")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Rectangle().fill(Color.blue))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding()
            }
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

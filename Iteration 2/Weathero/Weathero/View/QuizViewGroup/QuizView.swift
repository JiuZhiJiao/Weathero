//
//  QuizView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
//        ChapterCardView(chapter: chapters[0])
//            .frame(width: 320, height: 350)
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    // Climate Change
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Climate Change")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                    .frame(width: 15)
                                ForEach(chapters) { chapter in
                                    if chapter.topic == "Climate Change"{
                                        NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
                                            ChapterCardView(progress: 0.5, chapter: chapter)
                                                .frame(width: 360, height: 380)
                                                .padding(5)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                
                                // Coming Soon Chapter
                                ChapterCardView(progress: 0.0, chapter: Chapter(id: 13, topic: "", chapterNO: 3, title: "Coming Soon", subtitle: "New Chapter will be uploaded soon", image: "ComingSoon", video: "", content: ""))
                                    .frame(width: 360, height: 380)
                                    .padding()
                                Spacer()
                                    .frame(width: 15)
                            }
                        }
                        .offset(x: 0, y: -25)
                        
                    }
                    
                    // Droughts
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Droughts")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                    .frame(width: 15)
                                ForEach(chapters) { chapter in
                                    if chapter.topic == "Droughts"{
                                        NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
                                            ChapterCardView(progress: 0.5, chapter: chapter)
                                                .frame(width: 360, height: 380)
                                                .padding(5)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                
                                // Coming Soon Chapter
                                ChapterCardView(progress: 0.0, chapter: Chapter(id: 22, topic: "", chapterNO: 2, title: "Coming Soon", subtitle: "New Chapter will be uploaded soon", image: "ComingSoon", video: "", content: ""))
                                    .frame(width: 360, height: 380)
                                    .padding()
                                Spacer()
                                    .frame(width: 15)
                            }
                        }
                        .offset(x: 0, y: -25)
                        
                    }
                    
                    // Floods
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Floods")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                    .frame(width: 15)
                                ForEach(chapters) { chapter in
                                    if chapter.topic == "Floods"{
                                        NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
                                            ChapterCardView(progress: 0.5, chapter: chapter)
                                                .frame(width: 360, height: 380)
                                                .padding(5)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                
                                // Coming Soon Chapter
                                ChapterCardView(progress: 0.0, chapter: Chapter(id: 32, topic: "", chapterNO: 2, title: "Coming Soon", subtitle: "New Chapter will be uploaded soon", image: "ComingSoon", video: "", content: ""))
                                    .frame(width: 360, height: 380)
                                    .padding()
                                Spacer()
                                    .frame(width: 15)
                            }
                        }
                        .offset(x: 0, y: -25)
                        
                    }
                    
                }
                .navigationTitle("Quiz")
            }
        }
    }
}

// preview of current view
#if DEBUG
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
#endif

//
//  ChapterQuizView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI
import RealmSwift

struct ChapterQuizView: View {
    @StateObject private var quizDB = QuizDatabase(realm: try! Realm())
    let chapter: Chapter
    
    var body: some View {
        
        ZStack {
            ForEach(quizDB.getQuiz(topic: chapter.topic)) { quiz in
                ChapterQuizDetailView(quiz: quiz)
            }
        }
        .navigationTitle(chapter.title)
    }
}

struct ChapterQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterQuizView(chapter: chapters[0])
    }
}

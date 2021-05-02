//
//  AnswerQuizFeedbackView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 21/4/21.
//

import SwiftUI
import RealmSwift

struct AnswerQuizFeedbackView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var qid: Int
    @Binding var selected: Int
    let chapter: Chapter
    @StateObject private var quizDB = QuizDatabase(realm: try! Realm())
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // Question content
                Text("Question 0\(qid+1)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(.top, 25)
                Text(quizDB.getQuiz(topic: chapter.topic)[qid].content)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                
                // User answer
                Text("Your Answer")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(.top, 25)
                
                switch selected {
                case 1:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionA)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 2:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionB)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 3:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionC)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 4:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionD)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                default:
                    Text("Not Selected")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                }
                
                // Correct Answer
                Text("Correct Answer")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(.top, 25)
                
                switch quizDB.getQuiz(topic: chapter.topic)[qid].correct {
                case 1:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionA)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 2:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionB)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 3:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionC)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                case 4:
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionD)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                default:
                    Text("Not Selected")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        .multilineTextAlignment(.leading)
                }
                
                // Feedback
                Text("Feedback")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(.top, 25)
                Text(quizDB.getQuiz(topic: chapter.topic)[qid].feedback)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 5)
                    .multilineTextAlignment(.leading)
                
            }
            .padding()
            Spacer()
            VStack(alignment: .center) {
                Text("Drag down to close the Feedback")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct AnswerQuizFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerQuizFeedbackView(qid: .constant(1), selected: .constant(0), chapter: chapters[0])
    }
}

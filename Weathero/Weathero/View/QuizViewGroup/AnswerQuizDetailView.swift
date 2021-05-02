//
//  AnswerQuizDetailView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 21/4/21.
//

import SwiftUI
import RealmSwift

struct AnswerQuizDetailView: View {
    @Binding var qid: Int
    @Binding var selected: Int
    @Binding var flag: Bool
    let chapter: Chapter
    @StateObject private var quizDB = QuizDatabase(realm: try! Realm())
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 22) {
                VStack(alignment: .leading) {
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].content)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 15)
                        .multilineTextAlignment(.leading)
                }
                VStack(alignment: .center) {
                    if quizDB.getQuiz(topic: chapter.topic)[qid].image != "ImageName" {
                        Image(quizDB.getQuiz(topic: chapter.topic)[qid].image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    selected = 1
                    flag.toggle()
                }, label: {
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionA)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 1), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    selected = 2
                    flag.toggle()
                }, label: {
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionB)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 2), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    selected = 3
                    flag.toggle()
                }, label: {
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionC)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 3), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    selected = 4
                    flag.toggle()
                }, label: {
                    Text(quizDB.getQuiz(topic: chapter.topic)[qid].optionD)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 4), lineWidth: 3)
                        )
                })
                .disabled(flag)
            }
            .padding()
        }
    }
    
    func color(option: Int) -> Color {
        if option == selected {
            if quizDB.getQuiz(topic: chapter.topic)[qid].correct == selected {
                return Color.green
            } else {
                return Color.red
            }
        } else {
            return Color.gray.opacity(0.5)
        }
    }
}

struct AnswerQuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerQuizDetailView(qid: .constant(1), selected: .constant(0), flag: .constant(false), chapter: chapters[0])
    }
}

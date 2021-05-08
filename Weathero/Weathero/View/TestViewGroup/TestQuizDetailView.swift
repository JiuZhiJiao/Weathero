//
//  TestQuizDetailView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 2/5/21.
//

import SwiftUI
import RealmSwift

struct TestQuizDetailView: View {
    let test: Test
    @StateObject private var quizDB = QuizDatabase(realm: try! Realm())
    @Binding var qid: Int
    @Binding var selected: Int
    @Binding var correctNumber: Int
    @Binding var flag: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(quizDB.getQuiz(mainTopic: test.topic)[qid].content)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            VStack(alignment: .center) {
                if quizDB.getQuiz(mainTopic: test.topic)[qid].image != "ImageName" {
                    Image(quizDB.getQuiz(mainTopic: test.topic)[qid].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .cornerRadius(10)
                }
            }
            
            VStack(alignment: .center, spacing: 10) {
                Button(action: {
                    flag.toggle()
                    selected = 1
                    check()
                }, label: {
                    Text(quizDB.getQuiz(mainTopic: test.topic)[qid].optionA)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 1), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    flag.toggle()
                    selected = 2
                    check()
                }, label: {
                    Text(quizDB.getQuiz(mainTopic: test.topic)[qid].optionB)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 2), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    flag.toggle()
                    selected = 3
                    check()
                }, label: {
                    Text(quizDB.getQuiz(mainTopic: test.topic)[qid].optionC)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 3), lineWidth: 3)
                        )
                })
                .disabled(flag)
                
                Button(action: {
                    flag.toggle()
                    selected = 4
                    check()
                }, label: {
                    Text(quizDB.getQuiz(mainTopic: test.topic)[qid].optionD)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color(option: 4), lineWidth: 3)
                        )
                })
                .disabled(flag)
            }
            .padding()
        }
        .navigationTitle("Topic: \(test.topic)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func check() {
        if quizDB.getQuiz(mainTopic: test.topic)[qid].correct == selected {
            correctNumber = correctNumber + 1
        }
    }
    
    func color(option: Int) -> Color {
        if option == selected {
            if quizDB.getQuiz(mainTopic: test.topic)[qid].correct == selected {
                return Color.green
            } else {
                return Color.red
            }
        } else {
            return Color.gray.opacity(0.5)
        }
    }
}

struct TestQuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TestQuizDetailView(test: tests[0], qid: .constant(0), selected: .constant(0), correctNumber: .constant(0), flag: .constant(false))
    }
}

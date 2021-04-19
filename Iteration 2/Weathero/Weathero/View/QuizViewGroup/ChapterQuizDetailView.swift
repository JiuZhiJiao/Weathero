//
//  ChapterQuizDetailView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI
import RealmSwift

struct ChapterQuizDetailView: View {
    var quiz: QuizModel
    @StateObject private var quizDB = QuizDatabase(realm: try! Realm())
    @State var selected = 0
    var body: some View {
        VStack(spacing: 22) {
            Spacer(minLength: 0)
            
            VStack(alignment: .leading) {
                Text(quiz.content)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    .multilineTextAlignment(.leading)
                if quiz.image != "ImageName" {
                    Image(quiz.image)
                        .resizable()
                        .cornerRadius(10)
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {selected = 1}, label: {
                Text(quiz.optionA)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: 1), lineWidth: 1)
                    )
            })
            
            Button(action: {selected = 2}, label: {
                Text(quiz.optionB)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: 2), lineWidth: 1)
                    )
            })
            
            Button(action: {selected = 3}, label: {
                Text(quiz.optionC)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: 3), lineWidth: 1)
                    )
            })
            
            Button(action: {selected = 4}, label: {
                Text(quiz.optionD)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: 4), lineWidth: 1)
                    )
            })
            
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Text("Submit")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                .disabled(quiz.selected != 0 ? true : false)
                .opacity(quiz.selected != 0 ? 0.7 : 1)
                
                Button(action: {}, label: {
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                .disabled(quiz.selected == 0 ? true : false)
                .opacity(quiz.selected == 0 ? 0.7 : 1)
                
            }.padding(.bottom)
        }
        .padding()
        .background(Color.white)
    }
    
    func color(option: Int) -> Color {
        if option == selected {
            if quiz.selected != 0 {
                if quiz.correct == selected {
                    return Color.green
                } else {
                    return Color.red
                }
            } else {
                return Color.blue
            }
        } else {
            return Color.gray
        }
    }
    
    func checkAns() {
        
    }
}

struct ChapterQuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterQuizDetailView(quiz: QuizModel(id: 1, topic: "Climate Change", image: "ClimateChange", content: "Which of the following statements is true?", optionA: "Extreme weather can be stopped", optionB: "Scientists cannot predict extreme weather", optionC: "Scientists warn about extreme weather", optionD: "Extreme weather doesn’t  have patterns", correct: 3, feedback: "Usually,Scientists use a professional prediction model and reliable data to predict what will happen in the following years."))
    }
}

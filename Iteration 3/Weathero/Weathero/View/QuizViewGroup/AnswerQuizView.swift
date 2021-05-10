//
//  AnswerQuizView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 21/4/21.
//

import SwiftUI

struct AnswerQuizView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var qid = 0
    @State var selected = 0
    @State var flag = false
    @State private var showFeedback = false
    let chapter: Chapter
    var body: some View {
        VStack {
            
            // Quiz Detail View
            VStack {
                AnswerQuizDetailView(qid: $qid, selected: $selected, flag: $flag, chapter: chapter)
            }
            
            // Button
            HStack(spacing: 15) {
//                NavigationLink(destination: AnswerQuizFeedbackView()) {
//                    Text("Feedback")
//                        .fontWeight(.heavy)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .cornerRadius(15)
//                }
//                .disabled(selected == 0 ? true : false)
//                .opacity(selected == 0 ? 0.7 : 1)
                
                Button(action: {
                    showFeedback.toggle()
                }, label: {
                    Text("Feedback")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                .sheet(isPresented: $showFeedback, content: {
                    AnswerQuizFeedbackView(qid: $qid, selected: $selected, chapter: chapter)
                })
                .disabled(selected == 0 ? true : false)
                .opacity(selected == 0 ? 0.7 : 1)
                
                Button(action: {
                    if qid < 2 {
                        qid = qid + 1
                        selected = 0
                        flag.toggle()
                    } else {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    if qid < 2 {
                        Text("Next")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(15)
                    } else {
                        Text("Finish")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                    
                })
                
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color(red: 242/255, green: 242/255 , blue:247/255).ignoresSafeArea())
    }
}

struct AnswerQuizView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerQuizView(chapter: chapters[0])
    }
}

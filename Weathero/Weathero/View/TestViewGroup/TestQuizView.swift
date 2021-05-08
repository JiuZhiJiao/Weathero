//
//  TestQuizView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 2/5/21.
//

import SwiftUI
import RealmSwift

struct TestQuizView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var heroDB = HeroDatabase(realm: try! Realm())
    @State private var progress: Float = 0.4
    @State var qid: Int = 0
    @State var selected: Int = 0
    @State var correctNumber: Int = 0
    @State var flag: Bool = false
    @State private var showNext = false
    @State private var showAlert = false
    let test: Test
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    TestQuizDetailView(test: test, qid: $qid, selected: $selected, correctNumber: $correctNumber, flag: $flag)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        HStack {
                            Text("Correct Answered")
                            Spacer()
                            Text("\(correctNumber)/2")
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        
                        TestProcessBarView(correctNumber: $correctNumber, width: UIScreen.main.bounds.width * 0.6)
                            .padding(.bottom, 10)
                    }
                    
                    VStack {
                        Button(action: {
                            if qid < 2 && correctNumber < 2 {
                                qid = qid + 1
                                selected = 0
                                flag.toggle()
                            } else {
                                showAlert = true
                            }
                        }, label: {
                            if correctNumber < 2 && qid < 2 {
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
                        .disabled(selected == 0 ? true : false)
                        .opacity(selected == 0 ? 0.7 : 1)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                }
                .padding([.horizontal, .bottom])
            }
            
            if showAlert {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.9)
                    VStack {
                        Spacer().frame(height: 100)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .shadow(radius: 3)
                            VStack {
                                if correctNumber < 2 {
                                    VStack {
                                        Text("😟Unfortunately")
                                            .font(.title)
                                            .bold()
                                        Spacer().frame(height: 40)
                                        Text("You only answered \(correctNumber) questions correctly, but you need to get \(2 - correctNumber) more correct answers to get the hero.")
                                            .font(.title2)
                                    }
                                    .padding(.horizontal)
                                    
                                    Spacer().frame(height: 80)
                                    
                                    Button(action: {
                                        goBack()
                                    }, label: {
                                        Text("Go Back")
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(width: 200)
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                    })
                                } else {
                                    VStack {
                                        Text("🎉Congratulation")
                                            .font(.title)
                                            .bold()
                                        Spacer().frame(height: 40)
                                        Text("You have answered \(correctNumber) questions correctly, you get the hero \(test.hero.name)!")
                                            .font(.title2)
                                    }
                                    .padding(.horizontal)
                                    
                                    Spacer().frame(height: 80)
                                    
                                    Button(action: {
                                        goBackWithChange()
                                    }, label: {
                                        Text("Go Back")
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(width: 200)
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                    })
                                }
                                
                            }
                            .padding()
                        }
                        .frame(width: 330, height: 400)
                        Spacer()
                    }
                }
            }
        }
    }
    
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func goBackWithChange() {
        heroDB.changeCollect(id: (test.id - 1), collect: true)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct TestQuizView_Previews: PreviewProvider {
    static var previews: some View {
        TestQuizView(test: tests[0])
    }
}

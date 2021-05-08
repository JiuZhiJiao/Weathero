//
//  SummaryView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI
import RealmSwift

struct SummaryView: View {
    @StateObject private var heroDB = HeroDatabase(realm: try! Realm())
    @ObservedObject var herosDB = BindableResults(results: try! Realm().objects(HeroData.self))
    @State private var showAlert = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: -16) {
                Spacer()
                VStack {
                    Text("Collection")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Check which heroes you have collected\n")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                
                
                VStack {
                    HStack {
                        HeroCardView(hero: herosDB.results.filter("id = %@", 0).first!)
                        HeroCardView(hero: herosDB.results.filter("id = %@", 1).first!)
                    }
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        HeroCardView(hero: herosDB.results.filter("id = %@", 2).first!)
                        ZStack {
                            HeroCardView(hero: herosDB.results.filter("id = %@", 3).first!)
                            
                            Button(action: update) {
                                RoundedRectangle(cornerRadius: 30)
                                    .opacity(0)
                            }
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text("Weathero - Not Collected"), message: Text("You need to collect all other three heros to collect the Weathero"), dismissButton: .cancel(Text("Got it")))
                            })
                        }
                    }
                }
                .padding()
                
//                LazyVGrid(columns: columns, spacing: 32) {
//                    ForEach(herosDB.results, id:\.id) { hero in
//                        HeroCardView(hero: hero)
//                    }
//                }
//                LazyHGrid(rows: rows) {
//                    ForEach(herosDB.results, id:\.id) { hero in
//                        HeroCardView(hero: hero)
//                    }
//                }
                
                Spacer()
                    .frame(height: 8)
                Text("Once you collect first three heros, click the last card to collect Weathero")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                    .frame(height: 32)
                Text("Weathero Version: 1.0")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .background(Color(red: 242/255, green: 242/255 , blue:247/255).ignoresSafeArea())
    }
    
    func update() {
        if heroDB.getHero(id: 0).collect && heroDB.getHero(id: 1).collect && heroDB.getHero(id: 2).collect {
            heroDB.changeCollect(id: 3, collect: true)
        } else {
            showAlert = true
        }
    }
}


// preview of current view
#if DEBUG
struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
#endif

//
//  HeroDatabase.swift
//  Weathero
//
//  Created by JiuZhiJiao on 8/5/21.
//

import Foundation
import RealmSwift

final class HeroDatabase: ObservableObject {
    private var heroResults: Results<HeroData>
    
    init(realm: Realm) {
        heroResults = realm.objects(HeroData.self)
        
        if heroResults.count == 0 {
            initHeros()
        }
    }
    
    func create(id: Int, name: String, image: String, desc: String, collect: Bool) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            
            let heroData = HeroData()
            heroData.id = id
            heroData.name = name
            heroData.image = image
            heroData.desc = desc
            heroData.collect = collect
            
            try realm.write {
                realm.add(heroData)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func initHeros() {
        /*
         .init(id:0, name: "Hero Kat", image: "Hero01", des: "Kat would enhence your power with the knowledge about climate change."),
         .init(id:1, name: "Hero Steve", image: "Hero02", des: "Steve would enhence your power with the knowledge about droughts."),
         .init(id:2, name: "Hero Thor", image: "Hero03", des: "Thor would enhence your power with the knowledge about floods."),
         .init(id:3, name: "Weathero", image: "Hero04", des: "Once you collect all other heros, the weathero would stay with you.")
         */
        
        create(id: 0, name: "Hero Kat", image: "Hero01", desc: "Kat would enhence your power with the knowledge about climate change", collect: false)
        create(id: 1, name: "Hero Steve", image: "Hero02", desc: "Steve would enhence your power with the knowledge about droughts", collect: false)
        create(id: 2, name: "Hero Thor", image: "Hero03", desc: "Thor would enhence your power with the knowledge about floods", collect: false)
        create(id: 3, name: "Weathero", image: "Hero04", desc: "Once you collect all other heros, the weathero would stay with you", collect: false)
        
    }
    
    func changeCollect(id: Int, collect: Bool) {
        let hero = self.heroResults.filter("id = %@", id)
        
        try! Realm().write {
            hero.first?.collect = collect
        }
    }
    
    func getHero(id: Int) -> HeroData {
        return heroResults[id]
    }
    
}

class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {

    var results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}

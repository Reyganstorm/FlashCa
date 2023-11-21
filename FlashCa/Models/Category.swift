//
//  Category.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.01.2023.
//

import RealmSwift
import Foundation

// Object - это тип данных фреймворка Realm
class Category: Object {
    
    @Persisted var name = ""
    @Persisted var date = Date()
    @Persisted var cards = List<Card>()
    
}


class Deck {
    var id = UUID()
    
    var name: String
    var date: Date
    var cards: Int
    var description: String
    
    init(id: UUID = UUID(), name: String, date: Date, cards: Int, description: String) {
        self.id = id
        self.name = name
        self.date = date
        self.cards = cards
        self.description = description
    }
    
    
}

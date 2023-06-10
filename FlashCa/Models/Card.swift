//
//  Card.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.01.2023.
//

import RealmSwift
import Foundation

class Card: Object {
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var date = Date()
}

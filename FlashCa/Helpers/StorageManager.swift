//
//  StorageManager.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.01.2023.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    // Open the local-only default realm
    let localRealm = try! Realm()
    
    
    private init() {}
    
    // MARK: - Category
    
    func save(_ categories: [Category]) {
        write {
            localRealm.add(categories)
        }
    }
    
    func save(_ category: Category) {
        write {
            localRealm.add(category)
        }
    }
    
    // MARK: - Card
    
    func save(_ card: Card, to category: Category) {
        write {
            category.cards.append(card)
        }
    }
    
    // MARK: - Delete
    
    func delete(_ category: Category) {
        write {
            localRealm.delete(category.cards)
            localRealm.delete(category)
        }
    }
    
    func delete(_ card: Card) {
        write {
            localRealm.delete(card)
        }
    }

    
    // MARK: - Edit
    
    
//    func edit(_ taskList: TaskList, newValue: String) {
//        write {
//            taskList.name = newValue
//        }
//    }
//    
//    func edit(_ task: Task, to newName: String, with newNote: String) {
//        write {
//            task.name = newName
//            task.note = newNote
//        }
//    }
    
//    // MARK: - Done
//    func done(_ taskList: TaskList) {
//        write {
//            taskList.tasks.setValue(true, forKey: "isCompleted")
//        }
//    }
//    
//    func done(_ task: Task) {
//        write {
//            task.isCompleted.toggle()
//        }
//    }
    
    
    private func write(completion: ()-> Void) {
        do {
            try localRealm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }
}

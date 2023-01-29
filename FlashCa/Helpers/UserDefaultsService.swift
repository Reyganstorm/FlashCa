//
//  UserDefaultsService.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 29.01.2023.
//

import Foundation

class UserDefaultsService {
    
    static let shared = UserDefaultsService()
    
    private enum Keys {
        static let isFirstLaunch = "isFirstLaunch"
    }
    
    var isFirstLaunch: Bool {
        get {
            let authToken = UserDefaults.standard.value(forKey: Keys.isFirstLaunch) as? Bool
            return authToken ?? false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isFirstLaunch)
        }
    }
}

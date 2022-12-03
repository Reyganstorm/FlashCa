//
//  SettingsController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class SettingsController: UIViewController , Routable {
    
    var router: MainRouter?
    
    private let settingsOption = [
        "Account",
        "touch/face ID",
        "Language",
        "About App"
    ]
    
    // About App - в нем будет 2 кнопки снизу поделиться и поддержка
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }

}

//
//  WelcomeViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit

class WelcomeViewController: UIViewController, Routable {
    var router: MainRouter?
    
    let baseView: WelcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setTitleToWelcomeView("Sweetheart")
        baseView.setTitleForCurrentCategoryButton("TESTING Now")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
}

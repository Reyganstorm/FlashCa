//
//  ViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.10.2022.
//

import UIKit

class FirstViewController: UIViewController, Routable {
    var router: MainRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }


}


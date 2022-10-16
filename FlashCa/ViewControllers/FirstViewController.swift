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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        
    }


}


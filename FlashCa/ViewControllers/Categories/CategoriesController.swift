//
//  CategoriesController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 08.01.2023.
//

import UIKit

final class CategoriesController: UIViewController, Routable {
    
    var router: MainRouter?
    
    private let baseView: CategoriesView = CategoriesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(baseView)
        baseView.frame = view.bounds
    }
}

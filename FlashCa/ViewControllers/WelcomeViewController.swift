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
        baseView.setTitleForCurrentCategoryButton("Test History")
        baseView.setTargetForCategoriesButton(target: self, action: #selector(currentButtonDidTap))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func currentButtonDidTap() {
        presentCategories()
    }
}

private extension WelcomeViewController {
    func presentCategories() {
        let vc = CategoriesController()
        vc.router = router
        if #available(iOS 15.0, *) {
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [ .large()]
            }
        } else {
            vc.modalPresentationStyle = .pageSheet
        }
        present(vc, animated: true, completion: nil)
    }
}

//
//  PrimalViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit

class PrimalViewController: UIViewController, Routable {
    var router: MainRouter?
    
    let baseView: PrimalView = PrimalView()
    
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

private extension PrimalViewController {
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

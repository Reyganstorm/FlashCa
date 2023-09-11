//
//  PrimalViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit

protocol PrimalCategoryDelegete {
    func setSelectCategory(category: String)
}

class PrimalViewController: UIViewController, Routable {
    
    var router: MainRouter?
    
    private let baseView: PrimalView = PrimalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setTitleForCurrentCategoryButton("Test History")
        baseView.setTargetForCategoriesButton(target: self, action: #selector(currentButtonDidTap))
        baseView.setTargetForSettingButton(target: self, action: #selector(didTapSettinsButton))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func currentButtonDidTap() {
        presentCategories()
    }
    
    @objc private func didTapSettinsButton() {
        router?.pushSettingsVC()
    }
}

extension PrimalViewController: PrimalCategoryDelegete {
    func setSelectCategory(category: String) {
        baseView.setTitleForCurrentCategoryButton(category)
    }
}

private extension PrimalViewController {
    func presentCategories() {
        let vc = CategoriesController()
        vc.delegate = self
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

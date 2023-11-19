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

enum PrimalFlowDirection {
    case dissmis
    case learn
    case chart
    case deck
    case settings
}

class PrimalViewController: UIViewController, FlowController {
    
    struct PrimalData {
        let flowDirection: PrimalFlowDirection
        let data: String?
    }
    
    var completionHandler: ((PrimalData) -> ())?
    var dissmisHandler: (() -> ())?
    
    private let baseView: PrimalView = PrimalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setTitleForCurrentCategoryButton("Test History")
        baseView.setTargetForCategoriesButton(target: self, action: #selector(currentButtonDidTap))
        baseView.setTargetForSettingButton(target: self, action: #selector(didTapSettinsButton))
        baseView.setTargetForStartButton(target: self, action: #selector(didTapLearn))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func currentButtonDidTap() {
        completionHandler?(PrimalData(flowDirection: .deck, data: "Hi"))
    }
    
    @objc private func didTapSettinsButton() {
//        router?.pushSettingsVC()
    }
    
    @objc private func didTapLearn() {
//        router?.pushLearnVC()
    }
}

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
    
    struct PrimalData{
        var flowDirection: PrimalFlowDirection
        var data: String?
    }
    
    var completionHandler: ((PrimalData) -> ())?
    var dissmisHandler: (() -> ())?
    
    private let baseView: PrimalView = PrimalView()
    
    override func viewWillAppear(_ animated: Bool) {
       self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setTitleForCurrentCategoryButton("Test History")
        baseView.setTargetForCategoriesButton(target: self, action: #selector(currentButtonDidTap))
        baseView.setTargetForChartsButton(target: self, action: #selector(didTapChartsButton))
        baseView.setTargetForStartButton(target: self, action: #selector(didTapLearn))
        baseView.setTargetForSettingsButton(target: self, action: #selector(didTapSettinsButton))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
}


// MARK: - Private button listeners
@objc private extension PrimalViewController {
    
    func currentButtonDidTap() {
        completionHandler?(PrimalData(flowDirection: .deck, data: "Hi"))
    }
    
    func didTapSettinsButton() {
        completionHandler?(PrimalData(flowDirection: .settings, data: "Hi"))
    }
    
    func didTapLearn() {
        completionHandler?(PrimalData(flowDirection: .learn, data: "Hi"))
    }
    
    func didTapChartsButton() {
        completionHandler?(PrimalData(flowDirection: .chart, data: "Hi"))
    }
}

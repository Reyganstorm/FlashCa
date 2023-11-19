//
//  MainCoordinator.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    var flowComplitionHandler: CoordinatorCompletionHandler?
    
    var navigationController: UINavigationController
    
    var data: String? = ""
    
    private var viewFactory = ViewFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showStartViewController()
    }
    
    
    func showStartViewController() {
        let vc = viewFactory.createPrimalViewController()
        
        vc.completionHandler = { [weak self] value in
            switch value.flowDirection {
            case .dissmis:
                print("dissmis")
            case .learn:
                print("dissmis")
            case .chart:
                print("dissmis")
            case .deck:
                self?.showDecksViewController()
            case .settings:
                print("dissmis")
            }
            self?.data = value.data
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func showDecksViewController() {
        let vc = viewFactory.createDecksViewController()
        
        vc.completionHandler = { [weak self] value in
            switch value.flowDirection {
            case .dissmis:
                self?.navigationController.popViewController(animated: true)
            case .another:
                print("dissmis")
            }
            self?.data = value.data
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
}

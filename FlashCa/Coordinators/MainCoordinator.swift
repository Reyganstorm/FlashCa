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
    
    var data = ""
    
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
            self?.data = value
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
}

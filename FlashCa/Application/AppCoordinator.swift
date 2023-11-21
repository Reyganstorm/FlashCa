//
//  AppCoordinator.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.10.2022.
//

import UIKit


class AppCoordinator: Coordinator {
    var flowComplitionHandler: CoordinatorCompletionHandler?
    
    var navigationController: UINavigationController
    
    private var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainFlow()
    }
    
    private func showMainFlow () {
        let mainCoordinator = CoordinatorFactory().createMainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        
        mainCoordinator.flowComplitionHandler = { [weak self] in
            self?.showMainFlow()
        }
        
        mainCoordinator.start()
    }
}


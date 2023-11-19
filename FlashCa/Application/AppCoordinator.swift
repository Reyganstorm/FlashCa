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
        
        showRegistrationFlow()
        
    }
    
    private func showRegistrationFlow() {
        let mainCoordinator = CoordinatorFactory().createMainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        
        mainCoordinator.flowComplitionHandler = { [weak self] in
            self?.showMainFlow()
        }
        
        mainCoordinator.start()
    }
    
    private func showMainFlow() {
        print("HI")
        navigationController.setViewControllers([UIViewController()], animated: true)
        
        print(navigationController.viewControllers)
    }
}


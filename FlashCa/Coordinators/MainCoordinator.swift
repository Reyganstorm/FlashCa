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
    
    private var data: String? = ""
    
    private var viewFactory = ViewFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showStartViewController()
    }
    
    // MARK: - Dissmis last VC
    private func dissmisVC() {
        navigationController.popViewController(animated: true)
    }
    
    private func show(_ vc: UIViewController) {
        navigationController.modalTransitionStyle = .flipHorizontal
        navigationController.pushViewController(vc, animated: true)
    }
}
    
    
    // MARK: - Presentation methods
extension MainCoordinator {
    func showStartViewController() {
        let vc = viewFactory.createPrimalVC()
        
        vc.completionHandler = { [weak self] value in
            switch value.flowDirection {
            case .dissmis:
//                self?.dissmisVC()
                print("dissmis")
            case .learn:
                self?.showLearnViewController()
            case .chart:
                self?.showChartsViewController()
            case .deck:
                self?.showDecksViewController()
            case .settings:
                self?.showSettingsViewController()
            }
            self?.data = value.data
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSettingsViewController() {
        let vc = viewFactory.createSettingsVC()
        
        vc.completionHandler = { [weak self] value in

            switch value.flowDirection {
            case .dissmis:
                self?.dissmisVC()
            }
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showLearnViewController() {
        let vc = viewFactory.createLearningVC()
        show(vc)
    }
    
    func showChartsViewController() {
        let vc = viewFactory.createChartsVC()
        show(vc)
    }
    
    func showDecksViewController() {
        let vc = viewFactory.createDecksVC()
        
        vc.completionHandler = { [weak self] value in
            switch value.flowDirection {
            case .dissmis:
                self?.dissmisVC()
            case .another:
                print("dissmis")
            }
            self?.data = value.data
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
}

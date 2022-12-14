//
//  MainRouter.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.10.2022.
//

import UIKit

protocol Routable: UIViewController {
    var router: MainRouter? { get set }
}


class MainRouter: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: true)
        self.navigationController = navigationController
    }
    
    // MARK: - PUSH ViewController
    
    func pushTabBar() {
        let vc = TabBarController()
        pushViewController(vc: vc, animated: true)
    }
    
    func pushWelcomeVC() {
        let vc = WelcomeViewController()
        pushViewController(vc: vc, animated: true)
    }

    // MARK: - Pablic func
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - Private Func
    
    private func pushViewController(vc: Routable, animated: Bool) {
        vc.router = self
        navigationController.pushViewController(vc, animated: animated)
    }
}

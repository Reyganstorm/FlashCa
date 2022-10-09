//
//  AppCoordinator.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.10.2022.
//

import Foundation
import UIKit


class AppCoordinator: NSObject {
    var window: UIWindow
    var router: MainRouter?
    
    init(window: UIWindow?) {
        self.window = window!
        super.init()
        startScreenFlow()
    }
    
    func didFinishLaunchingWithOptions(_ aplication: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? ) {
        
    }
    
    private func startScreenFlow() {
        let navController = UINavigationController()
        router = MainRouter(navigationController: navController)
        router?.pushVC()
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
    }
}

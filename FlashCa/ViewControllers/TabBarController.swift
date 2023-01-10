//
//  TabBarController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

enum Tabs: Int {
    case main
    case edit
    case settings
}

final class TabBarController: UITabBarController, Routable {
    
    var router: MainRouter?
    
    let main = MainController()
    let edit = EditingController()
    let settings = SettingsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
    }
    
    private func generateTabBar() {
        
        tabBar.tintColor = Resources.Colors.activ
        tabBar.barTintColor = Resources.Colors.inActiv
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        main.router = router
        edit.router = router
        settings.router = router
        
        generateTabBarItems(vc: main, title: "Main", image: UIImage(systemName: "person.crop.circle.fill"))
        generateTabBarItems(vc: edit, title: "Edit", image: UIImage(systemName: "seal"))
        generateTabBarItems(vc: settings, title: "Settings", image: UIImage(systemName: "gear"))
        
        viewControllers = [
            main,
            edit,
            UINavigationController(rootViewController: settings)
        ]
    }
    
    private func generateTabBarItems(vc: UIViewController, title: String, image: UIImage?){
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
    }
    
}

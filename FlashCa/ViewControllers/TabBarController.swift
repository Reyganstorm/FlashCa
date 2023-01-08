//
//  TabBarController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class TabBarController: UITabBarController, Routable {
    
    var router: MainRouter?
    
    let main = MainController()
    let edit = EditingController()
    let settings = SettingsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        
        main.router = router
        edit.router = router
        settings.router = router
        
        generateTabBarItems(vc: main, title: "Main", image: UIImage(systemName: "person.crop.circle.fill"))
        generateTabBarItems(vc: edit, title: "Edit", image: UIImage(systemName: "seal"))
        generateTabBarItems(vc: settings, title: "Settings", image: UIImage(systemName: "gear"))
        
        viewControllers = [
            UINavigationController(rootViewController: main),
            edit,
            UINavigationController(rootViewController: settings)
        ]
    }
    
    private func generateTabBarItems(vc: UIViewController, title: String, image: UIImage?){
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height),
            cornerRadius: height/2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainMedium?.cgColor
        tabBar.tintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.white
        
    }
}

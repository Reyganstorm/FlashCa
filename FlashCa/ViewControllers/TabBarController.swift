//
//  TabBarController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class TabBarController: UITabBarController, Routable {
    
    var router: MainRouter?
    
    let first = ListGroupController()
    let second = SecondViewController()
    let third = ThirdViewController()
    let four = FourViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        
        first.router = router
        second.router = router
        third.router = router
        four.router = router
        
        generateTabBarItems(vc: first, title: "First", image: UIImage(systemName: "person.crop.circle.fill"))
        generateTabBarItems(vc: second, title: "Second", image: UIImage(systemName: "airplane.circle.fill"))
        generateTabBarItems(vc: third, title: "third", image: UIImage(systemName: "command.circle"))
        generateTabBarItems(vc: four, title: "Four", image: UIImage(systemName: "seal"))
        
        viewControllers = [
            UINavigationController(rootViewController: first),
            second,
            third,
            four
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
        
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.tintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.gray
        
    }
}
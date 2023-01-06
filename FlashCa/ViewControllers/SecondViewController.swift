//
//  SecondViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class SecondViewController: UIViewController, Routable {
    
    var router: MainRouter?
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        button.backgroundColor = .white
        
        view.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(100)
//        }
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: .zero, size: button.frame.size)
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: button.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        button.layer.addSublayer(gradient)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

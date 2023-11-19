//
//  Coordinator.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

typealias CoordinatorCompletionHandler = ()->()

protocol Coordinator: AnyObject {
    
    var flowComplitionHandler: CoordinatorCompletionHandler? { get set }
    
    var navigationController: UINavigationController { get set}
    
    func start()
}


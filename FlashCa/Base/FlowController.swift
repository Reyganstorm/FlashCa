//
//  FlowController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 20.11.2023.
//

import UIKit

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T)->())? {get set}
    
}

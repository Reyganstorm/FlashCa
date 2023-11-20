//
//  ViewFactory.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

final class ViewFactory {
    
    // MARK: Primal
    func createPrimalViewController() -> PrimalViewController {
        return PrimalViewController()
    }
    
    // MARK: Decks
    func createDecksViewController() -> CategoriesController {
        return CategoriesController()
    }
    
    // MARK: Charts
    func createChartsViewController() -> ChartsViewController {
        return ChartsViewController()
    }
    
    // MARK: Settings
    func createSettingsVC() -> SettingsController {
        return SettingsController()
    }
    
    // MARK: Learning
    func createLearningVC() -> LearnViewController {
        return LearnViewController()
    }
    
}

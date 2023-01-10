//
//  MainView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    private let welcomeView: WelcomeNavView = {
        let view = WelcomeNavView()
        
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(welcomeView)
        
    }
    
    private func setupConstraints() {
        welcomeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    func setTitleToWelcomeView(_ name: String) {
        welcomeView.setTitle("Welcome, \(name)!")
    }
}

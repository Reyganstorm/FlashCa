//
//  WelcomeView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit
import SnapKit

final class WelcomeView: UIView {
    
    private let welcomeView: WelcomeNavView = {
        let view = WelcomeNavView()
        
        return view
    }()
    
    private let containerView = UIView()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "FlaskCa"
        label.font = Resources.Fonts.helveticaBold(with: 50)
        label.textColor = Resources.Colors.activ
        label.textAlignment = .center
        return label
    }()
    
    private let currentCategoryButton = CurrentCategoryButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WelcomeView {
    func setTitleToWelcomeView(_ name: String) {
        welcomeView.setTitle("Welcome, \(name)!")
    }
    
    func setTitleForCurrentCategoryButton(_ title: String) {
        currentCategoryButton.setTitle(title)
    }
}

private extension WelcomeView {
    func addViews() {
        addSubview(welcomeView)
        addSubview(containerView)
        containerView.addSubview(logoLabel)
        containerView.addSubview(currentCategoryButton)
    }
    
    func layoutViews() {
        welcomeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        currentCategoryButton.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.width.greaterThanOrEqualTo(130)
            make.height.equalTo(40)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        backgroundColor = .clear
    }
}

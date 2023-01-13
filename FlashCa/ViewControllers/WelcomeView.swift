//
//  WelcomeView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit
import SnapKit

final class WelcomeView: UIView {
    
    private let containerView = UIView()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "FlashCa"
        label.font = Resources.Fonts.helveticaBold(with: 50)
        label.textColor = Resources.Colors.activ
        label.textAlignment = .center
        return label
    }()

    private let currentCategoryButton: CurrentCategoryButton = {
        let button = CurrentCategoryButton()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        return button
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Learn", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        
        return button
    }()
    
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
    
    func setTitleForCurrentCategoryButton(_ title: String) {
        currentCategoryButton.setTitleCategory(title)
    }
}

private extension WelcomeView {
    func addViews() {
        addSubview(containerView)
        containerView.addSubview(logoLabel)
        containerView.addSubview(currentCategoryButton)
        containerView.addSubview(startButton)
    }
    
    func layoutViews() {
        
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
//            make.bottom.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(currentCategoryButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        backgroundColor = .clear
    }
}

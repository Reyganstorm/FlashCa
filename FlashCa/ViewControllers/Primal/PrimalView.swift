//
//  PrimalView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit
import SnapKit

final class PrimalView: UIView {
    
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
    
    private let chartsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Charts", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Resources.Fonts.helveticaBold(with: 16)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        return button
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Resources.Fonts.helveticaBold(with: 16)
        button.layer.cornerRadius = 14
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
        button.titleLabel?.font = Resources.Fonts.helveticaBold(with: 16)
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

extension PrimalView {
    
    func setTitleForCurrentCategoryButton(_ title: String) {
        currentCategoryButton.setTitleCategory(title)
    }
    
    func setTargetForCategoriesButton(target: Any, action: Selector) {
        currentCategoryButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTargetForChartsButton(target: Any, action: Selector) {
        chartsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTargetForSettingsButton(target: Any, action: Selector) {
        settingsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTargetForStartButton(target: Any, action: Selector) {
        startButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

private extension PrimalView {
    func addViews() {
        addSubview(containerView)
        containerView.addSubview(logoLabel)
        containerView.addSubview(currentCategoryButton)
        containerView.addSubview(chartsButton)
        containerView.addSubview(settingsButton)
        containerView.addSubview(startButton)
    }
    
    func layoutViews() {
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        currentCategoryButton.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(currentCategoryButton.snp.bottom).offset(10)
            make.right.equalTo(currentCategoryButton)
            make.height.width.equalTo(45)
        }
        
        chartsButton.snp.makeConstraints { make in
            make.top.equalTo(currentCategoryButton.snp.bottom).offset(10)
            make.left.equalTo(currentCategoryButton)
            make.centerX.equalToSuperview()
            make.right.equalTo(settingsButton.snp.left).offset(-10)
            make.height.equalTo(45)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(chartsButton.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        backgroundColor = .clear
    }
}

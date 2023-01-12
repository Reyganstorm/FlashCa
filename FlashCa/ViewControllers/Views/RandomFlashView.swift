//
//  RandomFlashView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 11.01.2023.
//

import UIKit

final class RandomFlashView: UIView {
    
    
    private let randomButton = UIButton()
    private let settingImage = UIImageView()
    private let settingsButton = UIButton()
    
    
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


private extension RandomFlashView {
    func addViews() {
        addSubview(randomButton)
        addSubview(settingsButton)
        addSubview(settingImage)
    }
    
    func layoutViews() {
        
        settingsButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.width.equalTo(40)
            make.top.bottom.equalToSuperview()
        }
        
        settingImage.snp.makeConstraints { make in
            make.center.equalTo(settingsButton.snp.center)
            make.width.height.equalTo(30)
        }
        
        randomButton.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(settingsButton.snp.left).offset(-5)
        }
    }
    
    func configure() {
        backgroundColor = .gray
        layer.cornerRadius = 14
        
        randomButton.backgroundColor = .black
        randomButton.layer.cornerRadius = 14
        randomButton.setTitle("Learn Random Category", for: .normal)
        randomButton.titleLabel?.textColor = .white
        randomButton.titleLabel?.numberOfLines = 0
        randomButton.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 12)
        
        settingsButton.layer.cornerRadius = 14
        settingsButton.backgroundColor = .black
        
        settingImage.image = Resources.Images.Common.settings?.withRenderingMode(.alwaysTemplate)
        settingImage.tintColor = .white
    }
}

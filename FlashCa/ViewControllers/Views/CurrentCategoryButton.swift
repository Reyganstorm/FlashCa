//
//  CurrentCategoryButton.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit

final class CurrentCategoryButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension CurrentCategoryButton {
    
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    func layoutViews() {
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(10)
            make.width.equalTo(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(iconView.snp.left)
            make.left.equalToSuperview().offset(10)
        }
    }
    
    func configure() {
        backgroundColor = .white
        layer.cornerRadius = 14
        layer.borderColor = Resources.Colors.activ?.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = false
        makeSystem(self)
        
        
        label.textColor = Resources.Colors.activ
        label.textAlignment = .center
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        
        
        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resources.Colors.activ
    }
}

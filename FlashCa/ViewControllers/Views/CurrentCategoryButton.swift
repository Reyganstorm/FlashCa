//
//  CurrentCategoryButton.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit

final class CurrentCategoryButton: UIButton {
    
    private let titleCategoryLabel = UILabel()
    private let categoryLabel = UILabel()
    private let iconView: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.Common.rightArrow
        image.tintColor = .black
        return image
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
    
    func setTitleCategory(_ title: String) {
        categoryLabel.text = title
    }
}

private extension CurrentCategoryButton {
    
    func addViews() {
        addSubview(titleCategoryLabel)
        addSubview(categoryLabel)
        addSubview(iconView)
    }
    
    func layoutViews() {
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(25)
            make.width.equalTo(15)
        }
        
        titleCategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.right.equalTo(iconView.snp.left)
            make.left.equalToSuperview().offset(10)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleCategoryLabel.snp.bottom).offset(5)
            make.right.left.equalTo(titleCategoryLabel)
            make.bottom.equalToSuperview().offset(-7)
            
        }
    }
    
    func configure() {
        backgroundColor = .white
        layer.cornerRadius = 14
        layer.borderColor = Resources.Colors.activ?.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = false
        makeSystem(self)
        
        
        titleCategoryLabel.textColor = Resources.Colors.activ
        titleCategoryLabel.textAlignment = .left
        titleCategoryLabel.font = Resources.Fonts.helveticaRegular(with: 15)
        titleCategoryLabel.numberOfLines = 0
        titleCategoryLabel.text = "Choosed Category:"
        
        categoryLabel.textColor = Resources.Colors.activ
        categoryLabel.textAlignment = .left
        categoryLabel.font = Resources.Fonts.helveticaRegular(with: 13)
        categoryLabel.numberOfLines = 0
    }
}

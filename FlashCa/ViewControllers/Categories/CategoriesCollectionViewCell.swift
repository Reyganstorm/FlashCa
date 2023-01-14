//
//  CategoriesCollectionViewCell.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 14.01.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-SemiBold", size: 12)
        label.textColor = UIColor(red: 0.243, green: 0.255, blue: 0.333, alpha: 1)
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .white : UIColor(red: 0.243, green: 0.255, blue: 0.333, alpha: 1)
            containerView.backgroundColor = isSelected ? .blue : .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
    
    private func setViews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    private func setConstrains() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
}

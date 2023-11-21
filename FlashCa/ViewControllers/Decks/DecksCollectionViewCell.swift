//
//  DecksCollectionViewCell.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 14.01.2023.
//

import UIKit

final class DecksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    private let coverView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let cardCounter = CounterCardsView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.243, green: 0.255, blue: 0.333, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor(red: 0.243, green: 0.255, blue: 0.333, alpha: 1)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .white : UIColor(red: 0.243, green: 0.255, blue: 0.333, alpha: 1)
            containerView.backgroundColor = isSelected ? .black : .white
            descriptionLabel.textColor = isSelected ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setViews()
        setConstrains()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(deck: Deck) {
        titleLabel.text = deck.name
        cardCounter.setNumber(deck.cards)
        descriptionLabel.text = deck.description
    }
    
    private func setViews() {
        addSubview(coverView)
        addSubview(containerView)
        coverView.addSubview(cardCounter)
        coverView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
    }
    
    private func setConstrains() {
        
        let cellWidth = (Resources.Size.width - 60)/2
        
        coverView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
//            make.height.equalTo(cellWidth/3)
        }
        
        containerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(coverView.snp.bottom)
            make.width.equalTo(cellWidth)
            make.height.equalTo(cellWidth/2)
        }
        
        cardCounter.snp.makeConstraints { make in
//            make.bottom.lessThanOrEqualToSuperview().offset(-5)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
            make.left.equalTo(cardCounter.snp.right).offset(5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.bottom.lessThanOrEqualToSuperview().offset(-5)
        }
        
    }
    
    private func configure() {
        
        cardCounter.layer.cornerRadius = 3
        cardCounter.layer.cornerRadius = 5
        cardCounter.layer.borderWidth  = 2
        cardCounter.layer.borderColor = UIColor.black.cgColor
        cardCounter.backgroundColor = .white
        
        layer.cornerRadius = 10
        layer.borderWidth  = 2
        layer.borderColor = UIColor.black.cgColor
        layer.masksToBounds = true
    }
}

//
//  CategoriesView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 14.01.2023.
//

import UIKit
import SnapKit

class CategoriesView: UIView {

    private let title: UILabel = {
        let label = UILabel()
        label.text = "Categories:"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Resources.Fonts.helveticaBold(with: 20)
        return label
    }()

    private let addImage: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.Common.settings
        return image
    }()
    
    private let addButton = UIButton()
    
    private let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collection.isScrollEnabled = false
        return collection
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

private extension CategoriesView {
    func addViews() {
        addSubview(title)
        addSubview(addImage)
        addSubview(addButton)
        addSubview(collectionView)
    }
    
    func layoutViews() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(addButton.snp.left).offset(-10)
        }
        
        addImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.width.equalTo(20)
        }
        
        addButton.snp.makeConstraints { make in
            make.edges.equalTo(addImage)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        backgroundColor = .clear
    }
}

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
        image.image = Resources.Images.Common.add
        return image
    }()
    
    private let addButton = UIButton()
    
    private let editImage: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.Common.edit
        return image
    }()
    
    private let editButton = UIButton()
    
    private let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 13
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .init(width: 150, height: 40)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.contentInset.left = 20
        collection.contentInset.right = 20
        collection.contentInset.top = 20
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
        addSubview(addImage)
        addSubview(editImage)
        addSubview(title)
        addSubview(addButton)
        addSubview(editButton)
        addSubview(collectionView)
    }
    
    func layoutViews() {
        addImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.width.equalTo(30)
        }
        
        editImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.right.equalTo(addImage.snp.left).offset(-10)
            make.height.width.equalTo(30)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(addImage)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(editButton.snp.left).offset(-10)
        }
        
        addButton.snp.makeConstraints { make in
            make.edges.equalTo(addImage)
        }
        
        editButton.snp.makeConstraints { make in
            make.edges.equalTo(editImage)
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

extension CategoriesView {
    // MARK: - CollectionView
    func setDelegateToCollection(dataSourse: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collectionView.dataSource = dataSourse
        collectionView.delegate = delegate
    }
}

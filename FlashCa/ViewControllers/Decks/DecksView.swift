//
//  DecksView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 14.01.2023.
//

import UIKit
import SnapKit

class DecksView: UIView {

    private let title: UILabel = {
        let label = UILabel()
        label.text = "Categories:"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Resources.Fonts.helveticaBold(with: 30)
        return label
    }()
    
    private let addButton: ImageButton = {
        let button = ImageButton()
        button.setImage(Resources.Images.Common.add)
        button.setImageColor(.black)
        return button
    }()
    
    private let editButton: ImageButton = {
        let button = ImageButton()
        button.setImage(Resources.Images.Common.edit)
        button.setImageColor(.black)
        return button
    }()
    
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
        collection.register(DecksCollectionViewCell.self, forCellWithReuseIdentifier: DecksCollectionViewCell.identifier)
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

extension DecksView {
    func addTargetToAddButton(target: Any, action: Selector) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addTargetToEditButton(target: Any, action: Selector) {
        editButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

private extension DecksView {
    func addViews() {
        addSubview(title)
        addSubview(addButton)
        addSubview(editButton)
        addSubview(collectionView)
    }
    
    func layoutViews() {
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(addButton)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(editButton.snp.left).offset(-10)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-25)
            make.height.width.equalTo(50)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerY.equalTo(addButton)
            make.right.equalTo(addButton.snp.left).offset(-10)
            make.size.equalTo(addButton)
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

extension DecksView {
    // MARK: - CollectionView
    func setDelegateToCollection(dataSourse: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collectionView.dataSource = dataSourse
        collectionView.delegate = delegate
    }
}

//
//  CategoriesController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 08.01.2023.
//

import UIKit

final class CategoriesController: UIViewController {
    
    var delegate: PrimalCategoryDelegete?
    
    private let stabs = ["History", "Life cycles", "Async Await", "Love", "American Literature"]
    
    private let baseView: CategoriesView = CategoriesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setDelegateToCollection(dataSourse: self, delegate: self)
        baseView.addTargetToAddButton(target: self, action: #selector(addButtonDidTap))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(baseView)
        baseView.frame = view.bounds
    }
}

@objc private extension CategoriesController {
    func addButtonDidTap() {
        let alert = UIAlertController(title: "Экран еще не готов", message: nil, preferredStyle: .actionSheet)
        let destrAction = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(destrAction)
        present(alert, animated: true)
    }
}

extension CategoriesController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        let stab = stabs[indexPath.item]
        cell.setupCell(title: stab)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = stabs[indexPath.item]
        delegate?.setSelectCategory(category: item)
        dismiss(animated: true)
    }
}


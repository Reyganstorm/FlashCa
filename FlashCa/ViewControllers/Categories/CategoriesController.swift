//
//  CategoriesController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 08.01.2023.
//

import UIKit

final class CategoriesController: UIViewController, Routable {
    
    var router: MainRouter?
    
    private let stabs = ["History", "Life cycles", "Async Await", "Lowe", "American Literature"]
    
    private let baseView: CategoriesView = CategoriesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.setDelegateToCollection(dataSourse: self, delegate: self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(baseView)
        baseView.frame = view.bounds
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
}


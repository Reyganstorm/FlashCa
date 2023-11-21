//
//  DecksController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 08.01.2023.
//

import UIKit

enum DecksFlowDirection {
    case dissmis
    case another
}

final class DecksController: UIViewController, FlowController {
    
    struct DecksData {
        let flowDirection: DecksFlowDirection
        let data: String?
    }
    
    var completionHandler: ((DecksData) -> ())?
    
    private let decks = [
        Deck(name: "History",
             date: Date(),
             cards: 16,
             description: "Random words"
            ),
        
        Deck(name: "Life cycles",
             date: Date(),
             cards: 4,
             description: "Random words"
            ),
        
        Deck(name: "Async Await",
             date: Date(),
             cards: 100,
             description: "Random words"
            ),
        
        Deck(name: "Love",
             date: Date(),
             cards: 20,
             description: "Random words"
            ),
        
        Deck(name: "American Literature",
             date: Date(),
             cards: 0,
             description: "Random words"
            )
    ]
    
    private let baseView: DecksView = DecksView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
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

@objc private extension DecksController {
    func addButtonDidTap() {
        completionHandler?(DecksData(flowDirection: .dissmis, data: "Hihi"))
    }
}

extension DecksController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        decks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DecksCollectionViewCell.identifier, for: indexPath) as! DecksCollectionViewCell
        let deck = decks[indexPath.item]
        cell.setupCell(deck: deck)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = stabs[indexPath.item]
        dismiss(animated: true)
    }
}


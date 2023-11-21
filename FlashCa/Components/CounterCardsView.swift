//
//  CounterCardsView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 21.11.2023.
//

import UIKit
import SnapKit

final class CounterCardsView: UIView {

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "0"
        return label
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
    
    func setNumber(_ number: Int?) {
        guard let n = number else {
            countLabel.text = "??"
            return
        }
        countLabel.text = "\(n)"
    }
}


extension CounterCardsView: BaseView {
    func addViews() {
        addSubview(countLabel)
    }
    
    func layoutViews() {
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configure() {
        
    }
}
